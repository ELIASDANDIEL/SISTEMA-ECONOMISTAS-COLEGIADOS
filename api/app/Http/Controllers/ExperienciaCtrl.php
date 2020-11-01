<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\{Experiencia};
use DB;
use MiAuth;

class ExperienciaCtrl extends Controller
{
    public function index()
    {
        $colegiado = MiAuth::check()->colegiado;

        $experiencia = Experiencia::where('colegiado_id',$colegiado->id)->get();

    	return $experiencia;
    }

    public function getForColegiado($colegiado_id)
    {
        $experiencia = Experiencia::where('colegiado_id',$colegiado_id)->get();
    	return $experiencia;
    }

    public function store(Request $request)
    {
        try
        {
            $rules = [
                'empresa' => 'required',
                'rubro'  => 'required',
                'anios_experiencia' => 'required',
                'cargo' => 'required',
                'es_vigente' => 'nullable',
                'pais' => 'required',
                'anio_ingreso' => 'required',
                'anio_salida' => 'nullable',
            ];

            $validator = \Validator::make($request->all(),$rules);

            if($validator->fails()) return ['fails' => $validator->errors()->getMessages()];

            if(is_null($request->colegiado_id)){
                $request['colegiado_id'] = MiAuth::check()->colegiado->id;
            }

            Experiencia::create($request->all());

            return [
                'success' => true,
                'message' => "Experiencia laboral registrada correctamente"
            ];
        }
        catch(\Exception $e)
        {
            return [
                'success' => false,
                'message' => 'Ocurrio un error al intentar registrar',
                'error'   => $e->getMessage()
            ];
        }   
    }

    public function update(Request $request,$id)
    {
        try 
        {
            $experiencia = Experiencia::find($id);

            if(is_null($experiencia)) throw new \Exception("Registro no encontrado.");

            $rules = [
                'empresa' => 'required',
                'rubro'  => 'required',
                'anios_experiencia' => 'required',
                'cargo' => 'required',
                'es_vigente' => 'nullable',
                'pais' => 'required',
                'anio_ingreso' => 'required',
                'anio_salida' => 'nullable',
            ];

            $validator = \Validator::make($request->all(),$rules);

            if($validator->fails()) return ['fails' => $validator->errors()->getMessages()];

            $experiencia->update($request->all());

            return [
                'success' => true,
                'message' => "Experiencia laboral actualizado correctamente"
            ];

        } 
        catch (\Exception $e) {
            return [
                'success' => false,
                'message' => "Ocurrio un error al intentar actualizar",
                'error'   => $e->getMessage()
            ];          
        }
    }

    public function delete($id)
    {
        try 
        {
            $experiencia = Experiencia::find($id);

            if(is_null($experiencia)) throw new \Exception("Registro no encontrado, al parecer alguien lo elimino.");

            $experiencia->delete();

            return [
                'success' => true,
                'message' => "Experiencia laboral eliminada correctamente"
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