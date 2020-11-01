<?php

namespace App\Models;

class TipoDocumento extends \App\Model
{
    protected $table = 'tipo_documento';
    protected $fillable = [
        'nombre'
    ];

    public function familias()
    {
        return $this->hasMany(Familia::class);
    }

    public function colegiados()
    {
        return $this->hasMany(Colegiado::class);
    }
}