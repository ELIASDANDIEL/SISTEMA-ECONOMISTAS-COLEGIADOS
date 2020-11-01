<?php

namespace App\Models;

class Pais extends \App\Model
{
    protected $table = 'pais';
    protected $fillable = [
        'nombre'
    ];

    public function departamentos()
    {
        return $this->hasMany(Departamento::class);
    }
}