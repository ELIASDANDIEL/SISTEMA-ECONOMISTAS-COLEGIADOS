<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\{Colegiado,Usuario,Mensualidad,Parametro};
use DB;
use MiAuth;

class MensualidadCtrl extends Controller
{
    public function index()
    {
        $colegiados = Colegiado::where('enabled',true)->orderBy('codigo')->get();

        $ultima_mensualidad = Mensualidad::orderBy('created_at','desc')->first();

        $fecha_ultima_mensualidad = null;

        if($ultima_mensualidad){
            $fecha = new \Carbon\Carbon($ultima_mensualidad->created_at);
            $fecha_ultima_mensualidad = $fecha->diffForHumans();
        }

        return [
            'colegiados' => $colegiados,
            'fecha_ultima_mensualidad' => $fecha_ultima_mensualidad
        ];
    }

    public function generarMensualidadesDelMes()
    {
        DB::beginTransaction();
        try 
        {
            $anio = $this->now->year;
            $mes  = $this->now->month;
            $parametro = Parametro::whereClave('mensualidad')->first();

            if(is_null($parametro)) throw new \Exception("No ha configurado un monto para las mensualidades");

            $monto = intval($parametro->valor);

            $colegiados = Colegiado::where('enabled',true)->get();

            $colegiados->each(function ($colegiado) use ($anio,$mes,$monto) {
                $mensualidad = Mensualidad::where('colegiado_id',$colegiado->id)
                                        ->where('anio',$anio)
                                        ->where('mes',$mes)
                                        ->first();

                if(is_null($mensualidad)){

                    $_mes = str_pad($mes,2,"0",STR_PAD_LEFT);

                    Mensualidad::create([
                        'anio'  => $anio,
                        'mes'   => $_mes,
                        'monto' => $monto,
                        'por_cobrar' => true,
                        'colegiado_id' => $colegiado->id
                    ]);

                    $colegiado->deuda = $colegiado->deuda + $monto;
                    $colegiado->save();
                }
            });
            DB::commit();
            return [
                'success' => true,
                'message' => 'Mensualidades generadas correctamente'
            ];
        } 
        catch (\Exception $e) {
            DB::rollback();
            return [
                'success' => false,
                'error' => $e->getMessage(),
                'message' => 'Ocurrio un error al generar los cobros'
            ];
        }
    }

    public function detalle($colegiado_id)
    {
        $mensualidades = Mensualidad::where('colegiado_id',$colegiado_id)
                                    ->orderBy('created_at','asc')
                                    ->get();
        return $mensualidades;
    }

    public function pagar(Request $request)
    {
        DB::beginTransaction();
        try 
        {
            $mensualidad = Mensualidad::find($request->id);

            $mensualidad->update([
                'numero_referencia' => $request->numero_referencia,
                'es_pagado' => true,
                'abonado'   => $mensualidad->monto
            ]);

            $mensualidad->colegiado->deuda = $mensualidad->colegiado->deuda - $mensualidad->monto;
            $mensualidad->colegiado->save();
            
            DB::commit();
            return [
                'success' => true,
                'message' => "Pago registrado correctamente"
            ];
        } 
        catch (\Exception $e) 
        {
            DB::rollback();
            return [
                'success' => false,
                'message' => "Pago actualizado correctamente"
            ];
        }
    }
}
