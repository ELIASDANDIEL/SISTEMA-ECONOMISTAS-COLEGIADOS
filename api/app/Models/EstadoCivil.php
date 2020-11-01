<?php

namespace App\Models;

class EstadoCivil extends \App\Model
{
    protected $table = 'estado_civil';
    protected $fillable = [
        'nombre',
        'ingresa_hijos',
        'ingresa_pareja'
    ];
    protected $casts = [
        'ingresa_hijos' => 'boolean',
        'ingresa_pareja' => 'boolean'
    ];

    public function colegiados()
    {
        return $this->hasMany(Colegiado::class);
    }
}
