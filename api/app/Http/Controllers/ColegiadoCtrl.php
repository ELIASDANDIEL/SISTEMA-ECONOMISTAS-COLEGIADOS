<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\{Colegiado,Usuario,Mensualidad,Estado};
use DB;
use MiAuth;
use App\Http\Traits\ColegiadoQuery;

class ColegiadoCtrl extends Controller
{
    use ColegiadoQuery;

    public function index()
    {
        $colegiados = Colegiado::with('estadoCivil')
                                ->orderBy('codigo','asc')
                                ->get();
        $colegiados->each(function ($colegiado){
            $colegiado->nombre_completo = $colegiado->apellidos . " " . $colegiado->nombres;
            $colegiado->descripcion = $colegiado->nombre_completo . " / " . $colegiado->estadoCivil->nombre;
            // $colegiado->addVisible('id','codigo','nombres','apellidos','descripcion');
        });
        $ordered = $colegiados->sortBy('nombre_completo');
        return $ordered->values()->all();
    }

    public function store(Request $request)
    {
        DB::beginTransaction();
        try
        {
            $rules = [
                'nombres' => 'required',
                'apellidos' => 'required',
                'fecha_nacimiento' => 'required',
                'universidad_procedencia' => 'required',
                'direccion' => 'required',
                'correo' => 'required|unique:colegiado',
                'celular' => 'required|integer|max:999999999|min:900000000',
                'fijo'    => 'required|max:9',
                'estado_civil_id' => 'required',
                'tipo_documento_id' => 'required',
                'numero_documento' => 'required|max:8|unique:colegiado',
                'estado_id' => 'required',
                'sexo' => 'required',
                'pais_id' => 'required',
                'departamento_id' => 'required',
                'provincia_id' => 'required',
            ];

            $validator = \Validator::make($request->all(),$rules);

            if($validator->fails()) return ['fails' => $validator->errors()->getMessages()];

            #generar codigo
            $ultimo_colegiado = Colegiado::orderBy('codigo','desc')->first();

            $last_code_integer = 0;

            if($ultimo_colegiado){
                $last_code_integer = intval(substr($ultimo_colegiado->codigo,1));
            }

            $code_integer = str_pad($last_code_integer + 1,9,"0", STR_PAD_LEFT);

            $request['codigo'] = "{$code_integer}";

            #generar usuario
            $usuario = Usuario::create([
                'nombre' => $request['codigo'],
                'clave'  => bcrypt($request['codigo']),
                'rol_id' => 2,
                'token'  => bcrypt(uniqid())
            ]);
            #obtener estado según estado_id seleccionado
            $request['enabled'] = Estado::isEnabled($request->estado_id);

            #crear colegiado
            $request['usuario_id'] = $usuario->id;
            $colegiado = Colegiado::create($request->all());

            DB::commit();

            return [
                'success' => true,
                'message' => "Colegiado registrado correctamente",
                'model' => $colegiado
            ];
        }
        catch(\Exception $e)
        {
            DB::rollback();
            return [
                'success' => false,
                'message' => 'Ocurrio un error al intentar registrar un Colegiado',
                'error'   => $e->getMessage()
            ];
        }
    }

    public function update($id,Request $request)
    {
        DB::beginTransaction();
        try
        {
            $colegiado = Colegiado::find($id);

            if(is_null($colegiado)) throw new \Exception("colegiado no encontrado.");

            $rules = [
                'nombres' => 'required',
                'apellidos' => 'required',
                'fecha_nacimiento' => 'required',
                'universidad_procedencia' => 'required',
                'direccion' => 'required',
                'correo' => 'required|unique:colegiado,correo,'.$colegiado->id,
                'celular' => 'required|integer|max:999999999|min:900000000',
                'fijo'    => 'required|max:9',
                'estado_civil_id' => 'required',
                'tipo_documento_id' => 'required',
                'numero_documento' => 'required|max:8|unique:colegiado,numero_documento,'.$colegiado->id,
                'estado_id' => 'required',
                'sexo' => 'required',
                'pais_id' => 'required',
                'departamento_id' => 'required',
                'provincia_id' => 'required',
            ];

            $validator = \Validator::make($request->only(
                'nombres','apellidos','fecha_nacimiento','universidad_procedencia',
                'direccion','correo','celular','fijo','estado_civil_id','tipo_documento_id',
                'numero_documento','enabled','estado_id','sexo','pais_id','departamento_id',
                'provincia_id'
            ),$rules);

            if($validator->fails()) return ['fails' => $validator->errors()->getMessages()];

            #obtener estado según estado_id seleccionado
            $request['enabled'] = Estado::isEnabled($request->estado_id);

            $colegiado->update($request->only(
                'nombres','apellidos','fecha_nacimiento','universidad_procedencia',
                'direccion','correo','celular','fijo','estado_civil_id','tipo_documento_id',
                'numero_documento','enabled','estado_id','sexo','pais_id','departamento_id',
                'provincia_id'
            ));

            DB::commit();

            return [
                'success' => true,
                'message' => "Colegiado actualizado correctamente"
            ];
        }
        catch (\Exception $e) {
            DB::rollback();
            return [
                'success' => false,
                'message' => "Ocurrio un error al intentar actualizar al Colegiado",
                'error'   => $e->getMessage()
            ];
        }
    }

    public function mensualidades()
    {
        $colegiado = MiAuth::check()->colegiado;

        $mensualidades = Mensualidad::where('colegiado_id',$colegiado->id)
                                    ->orderBy('created_at','asc')
                                    ->get();
        return [
            'mensualidades' => $mensualidades,
            'deuda'         => $colegiado->deuda
        ];
    }

    #query
    public function query(Request $request)
    {
        return $this->colegiadoQuery($request);
    }
}
