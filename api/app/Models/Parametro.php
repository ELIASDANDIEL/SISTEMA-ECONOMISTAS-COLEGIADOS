<?php

namespace App\Models;

class Parametro extends \App\Model
{
    protected $table = 'parametro';
    protected $fillable = [
        'nombre',
        'clave',
        'valor',
        'isVisible',
        'isEditable'
    ];

    public static function BuscarPorClave($clave)
    {
    	$parametro = static::whereClave($clave)->first();

    	return $parametro;
    }
}
