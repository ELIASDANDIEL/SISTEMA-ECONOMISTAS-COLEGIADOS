<?php

namespace App\Models;

class Rol extends \App\Model
{
    protected $table = 'rol';
    protected $fillable = [
        'nombre'
    ];

    public function usuarios()
    {
        return $this->hasMany(Usuario::class);
    }
}