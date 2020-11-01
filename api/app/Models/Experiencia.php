<?php

namespace App\Models;

class Experiencia extends \App\Model
{
    protected $table = 'experiencia';
    protected $fillable = [
        'empresa',
        'rubro',
        'anios_experiencia',
        'cargo',
        'es_vigente',
        'pais',
        'anio_ingreso',
        'anio_salida',
        'colegiado_id'
    ];

    public function colegiado()
    {
        return $this->belongsTo(Colegiado::class);
    }
}
