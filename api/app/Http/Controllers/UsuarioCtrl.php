<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\{Usuario,Colegiado};
use MiAuth;
use Hash;
use DB;

class UsuarioCtrl extends Controller
{
    public function login(Request $request)
    {
    	try 
    	{
            $usuario = Usuario::whereNombre($request->usuario)->first();

            if(is_null($usuario)) throw new \Exception("Credenciales incorrectas");

            if(!Hash::check($request->clave,$usuario->clave)) 
                throw new \Exception("La contraseña es incorrecta.");

            return [
                'success' => true,
                'token'   => $usuario->token,
                'usuario' => $usuario
            ];
    	} 
    	catch (\Exception $e) 
    	{
    		return ['success' => false,'message' => $e->getMessage()];	
    	}
    }

    public function auth()
    {
        $usuario = MiAuth::check();
        return compact('usuario');
    }

    public function colegiado()
    {
        $colegiado = Colegiado::where('usuario_id',MiAuth::check()->id)->first();
        return $colegiado;
    }

    public function storePassword(Request $request)
    {
        DB::beginTransaction();
        try
        {
            $usuario = MiAuth::check();
            
            if($request->password != $request->password_confirm)    throw new \Exception("Las contraseñas no coinciden");
                
            $new_password = bcrypt($request->password);

            $usuario->update(['clave' => $new_password]);

            DB::commit();

            return [
                'success' => true,
                'message' => "Contraseña actualizada correctamente"
            ];
        }
        catch(\Exception $e)
        {
            DB::rollback();
            return [
                'success' => false,
                'message' => $e->getMessage()
            ];
        }  
    }   

    #Lista de Usuarios
    public function list()
    {
        $usuarios = Usuario::has('colegiado')->orderBy('nombre')->get();

        $usuarios->each(function ($usuario) {
           $usuario->colegiado_nombres = $usuario->colegiado->nombres . " " . $usuario->colegiado->apellidos;
        });

        return $usuarios;
    }
    #Modificar contraseña a los usuarios
    public function updatePassword(Request $request,$id)
    {
        DB::beginTransaction();
        try
        {
            $usuario = Usuario::find($id);
            
            if($request->clave != $request->repetir_clave)    
                throw new \Exception("Las contraseñas no coinciden");
                
            $new_clave = bcrypt($request->clave);

            $usuario->update(['clave' => $new_clave]);

            DB::commit();

            return [
                'success' => true,
                'message' => "Contraseña actualizada correctamente"
            ];
        }
        catch(\Exception $e)
        {
            DB::rollback();
            return [
                'success' => false,
                'message' => $e->getMessage()
            ];
        }  
    }
}
