<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\{Estudio};
use DB;
use MiAuth;

class EstudioCtrl extends Controller
{
    public function index()
    {
        $colegiado = MiAuth::check()->colegiado;

        $estudios = Estudio::with('tipoEstudio')
                        ->where('colegiado_id',$colegiado->id)
                        ->orderBy('descripcion')
                        ->get();
    	return $estudios;
    }

    public function getForColegiado($colegiado_id)
    {
        $estudios = Estudio::with('tipoEstudio')
                        ->where('colegiado_id',$colegiado_id)
                        ->orderBy('descripcion')
                        ->get();
    	return $estudios;
    }

    public function store(Request $request)
    {
        try
        {
            $rules = [
                'descripcion' => 'required',
                'anio_egreso'  => 'required',
                'duracion_meses' => 'required',
                'tipo_estudio_id' => 'required'
            ];

            $validator = \Validator::make($request->all(),$rules);

            if($validator->fails()) return ['fails' => $validator->errors()->getMessages()];

            if(is_null($request->colegiado_id)){
                $request['colegiado_id'] = MiAuth::check()->colegiado->id;
            }

            Estudio::create($request->all());

            return [
                'success' => true,
                'message' => "Estudio registrado correctamente"
            ];
        }
        catch(Exception $e)
        {
            return [
                'success' => false,
                'message' => 'Ocurrio un error al intentar registrar un Estudio',
                'error'   => $e->getMessage()
            ];
        }   
    }

    public function update(Request $request,$id)
    {
        try 
        {
            $estudio = Estudio::find($id);

            if(is_null($estudio)) throw new \Exception("Estudio no encontrado.");

            $rules = [
                'descripcion' => 'required',
                'anio_egreso'  => 'required',
                'duracion_meses' => 'required',
                'tipo_estudio_id' => 'required'
            ];

            $validator = \Validator::make($request->all(),$rules);

            if($validator->fails()) return ['fails' => $validator->errors()->getMessages()];

            $estudio->update($request->all());

            return [
                'success' => true,
                'message' => "Estudio actualizado correctamente"
            ];

        } 
        catch (\Exception $e) {
            return [
                'success' => false,
                'message' => "Ocurrio un error al intentar actualizar al Estudio",
                'error'   => $e->getMessage()
            ];          
        }
    }

    public function delete($id)
    {
        try 
        {
            $estudio = Estudio::find($id);

            if(is_null($estudio)) throw new \Exception("Estudio no encontrado, al parecer alguien lo elimino.");

            $estudio->delete();

            return [
                'success' => true,
                'message' => "Estudio eliminado correctamente"
            ];

        } 
        catch (\Exception $e) {
            return [
                'success' => false,
                'message' => $e->getMessage()
            ];          
        }   
    }
}