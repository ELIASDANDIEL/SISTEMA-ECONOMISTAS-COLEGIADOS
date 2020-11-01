<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\{
    Parametro,
    TipoDocumento,
    EstadoCivil,
    Estado,
    Parentesco,
    Pais,
    TipoEstudio
};
use DB;

class ParametroCtrl extends Controller
{
    public function index()
    {
    	$parametros = Parametro::orderBy('clave')->get();

    	return compact('parametros');
    }

    public function update(Request $request,$id)
    {
        try 
        {
            $parametro = Parametro::find($id);

            if(is_null($parametro)) throw new \Exception("Parametro no encontrado.");

            $rules = [
                'valor' => 'required'
            ];
            
            $validator = \Validator::make($request->all(),$rules);

            if($validator->fails()) return ['fails' => $validator->errors()->getMessages()];

            $parametro->update($request->only('valor'));

            return [
                'success' => true,
                'message' => "Parametro actualizado correctamente"
            ];

        } 
        catch (\Exception $e) {
            return [
                'success' => false,
                'message' => "Ocurrio un error al intentar actualizar al Parametro",
                'error'   => $e->getMessage()
            ];          
        }
    }

    public function colegiado()
    {
        $tipos_documentos  = TipoDocumento::orderBy('nombre')->get();
        $estados_civiles   = EstadoCivil::orderBy('nombre')->get();
        $estados_colegiado = Estado::orderBy('nombre')->get();
        $parentescos       = Parentesco::orderBy('nombre')->get();
        $paises            = Pais::with('departamentos.provincias')->orderBy('nombre')->get();

        return [
            'tipos_documentos' => $tipos_documentos,
            'estados_civiles'  => $estados_civiles,
            'estados_colegiados' => $estados_colegiado,
            'parentescos' => $parentescos,
            'paises' => $paises
        ];
    }

    public function estudio()
    {
        $tipo_estudios = TipoEstudio::orderBy('nombre')->get();

        return [
            'tipo_estudios' => $tipo_estudios
        ];
    }
}
