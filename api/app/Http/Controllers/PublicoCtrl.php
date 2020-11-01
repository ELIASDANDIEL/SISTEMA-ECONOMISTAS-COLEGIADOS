<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\{Colegiado};
use DB;

class PublicoCtrl extends Controller
{
    public function consultaColegiado($codigo)
    {
        try 
        {
            $colegiado = Colegiado::with(
                                    'tipoDocumento',
                                    'estadoCivil',
                                    'experienciaLaboral',
                                    'estudios',
                                    'familiares',
                                    'estado'
                                    )
                                    ->where('enabled',true)
                                    ->where('codigo',$codigo)
                                    ->first();
            if(is_null($colegiado)) throw new \Exception("No se encontro el colegiado");

            return [
                'success' => true,
                'info' => $colegiado
            ];
        } 
        catch (\Exception $e) 
        {
            return [
                'success' => false,
                'message' => $e->getMessage()
            ];
        }
    }
}
