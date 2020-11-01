<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\{
    Familia,
    Colegiado,
    Parentesco,
    EstadoCivil
};
use DB;
use MiAuth;

class FamiliarCtrl extends Controller
{
    public function index()
    {
        $colegiado = MiAuth::check()->colegiado;
        $familiares = Familia::with('tipoDocumento','parentesco')
                        ->where('colegiado_id',$colegiado->id)
                        ->orderBy('nombres')
                        ->get();
    	return $familiares;
    }

    public function getForColegiado($colegiado_id)
    {
        $familiares = Familia::with('tipoDocumento','parentesco')
                             ->where('colegiado_id',$colegiado_id)
                             ->orderBy('nombres')
                             ->get();
    	return $familiares;
    }

    public function store(Request $request)
    {
        try
        {
            if(is_null($request->colegiado_id)){
                $request['colegiado_id'] = MiAuth::check()->colegiado->id;
            }

            $rules = [
                'nombres' => 'required',
                'apellidos'  => 'required',
                'parentesco_id' => 'required',
                'fecha_nacimiento' => 'required',
                'numero_documento' => 'required',
                'tipo_documento_id' => 'required',
                'colegiado_id'      => 'required'
            ];

            $validator = \Validator::make($request->all(),$rules);

            if($validator->fails()) return ['fails' => $validator->errors()->getMessages()];

            #validar por esposo o hijos
            $colegiado = Colegiado::find($request['colegiado_id']);
            $estado_civil = $colegiado->estadoCivil;

            $parentesco = Parentesco::find($request->parentesco_id);

            if($parentesco->es_hijo){
                if($estado_civil->ingresa_hijos == false){
                    throw new \Exception("El colegiado es {$estado_civil->nombre}, por ende no puede ingresar hijos.");
                }
            }else if($parentesco->es_pareja){
                if($estado_civil->ingresa_pareja == false){
                    throw new \Exception("El colegiado es {$estado_civil->nombre}, por ende no puede ingresar una pareja.");
                }
                $parejas = Familia::where('colegiado_id',$request['colegiado_id'])
                                  ->whereHas('parentesco',function($q){
                                        $q->where('es_pareja',true);
                                    })->count();
                if($parejas > 0){
                    throw new \Exception("Usted ya tiene una pareja registrada");
                }
            }else{
                throw new \Exception("El parentesco seleccionado tiene una configuración erronea");
            }

            #validar documento de identidad
            $numeros_documentos = Familia::where('colegiado_id',$request['colegiado_id'])
                                        ->pluck('numero_documento')
                                        ->toArray();

            if(in_array($request->numero_documento,$numeros_documentos)) 
                throw new \Exception("Usted ya ha registrado a un familiar con el número de documento ingresado");

            Familia::create($request->all());

            return [
                'success' => true,
                'message' => "Familiar registrado correctamente"
            ];
        }
        catch(\Exception $e)
        {
            return [
                'success' => false,
                // 'message' => 'Ocurrio un error al intentar registrar un Familiar',
                'message'   => $e->getMessage()
            ];
        }   
    }

    public function update(Request $request,$id)
    {
        try 
        {
            $familiar = Familia::find($id);

            if(is_null($familiar)) throw new \Exception("Familiar no encontrado.");

            $rules = [
                'nombres' => 'required',
                'apellidos'  => 'required',
                'parentesco' => 'required',
                'fecha_nacimiento' => 'required',
                'numero_documento' => 'required',
                'tipo_documento_id' => 'required'
            ];

            $validator = \Validator::make($request->all(),$rules);

            if($validator->fails()) return ['fails' => $validator->errors()->getMessages()];

            if(is_null($request->colegiado_id)){
                $request['colegiado_id'] = MiAuth::check()->colegiado->id;
            }

            $numeros_documentos = Familia::where('colegiado_id',$request['colegiado_id'])
                                ->where('id','<>',$id)
                                ->pluck('numero_documento')
                                ->toArray();

            if(in_array($request->numero_documento,$numeros_documentos)) 
                throw new \Exception("Usted ya ha registrado a un familiar con el número de documento ingresado");

            $familiar->update($request->all());

            return [
                'success' => true,
                'message' => "Familiar actualizado correctamente"
            ];

        } 
        catch (\Exception $e) {
            return [
                'success' => false,
                // 'message' => "Ocurrio un error al intentar actualizar al Familiar",
                'message'   => $e->getMessage()
            ];          
        }
    }

    public function delete($id)
    {
        try 
        {
            $familiar = Familia::find($id);

            if(is_null($familiar)) throw new \Exception("Familiar no encontrado, al parecer alguien lo elimino.");

            $familiar->delete();

            return [
                'success' => true,
                'message' => "Familiar eliminado correctamente"
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