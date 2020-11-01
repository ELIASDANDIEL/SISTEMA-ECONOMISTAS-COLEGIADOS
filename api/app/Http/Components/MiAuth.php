<?php
namespace App\Http\Components;

class MiAuth
{
	private $usuario;

    public function check($usuario = null)
    {
		if(is_null($this->usuario)) $this->usuario = $usuario;
    	
    	return $this->usuario;
    }
}