<?php
namespace App\Http\Helpers;

use MiAuth;
use App\Models\Usuario;

class MiAuthManager
{
    private $request;
    private $token;

    public function __construct($request)
    {
        $this->request = $request;
    }

    public function checkWithToken()
    {
        $token   = self::getToken();
        $usuario = self::getUser($token);

        return $usuario;
    }

    public function getToken()
    {
        $token = $this->request->get('api_token');

        if (empty($token)) $token = $this->request->header('Authorization');
        
        return $token;
    }


    public function getUser($token)
    {
        if(empty($token)) return null;

        $usuario = Usuario::whereToken($token)->first();

        if(is_null($usuario)) return null;

        MiAuth::check($usuario);

        return $usuario;
    }
}
