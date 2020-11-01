<?php

namespace App\Models;

class Estado extends \App\Model
{
    protected $table = 'estado';
    protected $fillable = [
        'nombre',
        'enabled'
    ];
    protected $casts = [
        'enabled' => 'boolean'
    ];

    public static function isEnabled($id)
    {
        $row = static::find($id);

        if(is_null($row)) throw new \Exception("No se ha seleccionado un estado");

        return $row->enabled;
    }

}