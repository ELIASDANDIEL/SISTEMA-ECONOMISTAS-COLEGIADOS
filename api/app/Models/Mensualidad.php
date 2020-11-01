<?php

namespace App\Models;

class Mensualidad extends \App\Model
{
    protected $table = 'mensualidad';
    protected $fillable = [
        'anio',
        'mes',
        'monto',
        'numero_referencia',
        'colegiado_id',
        'es_pagado',
        'por_cobrar',
        'abonado'
    ];
    protected $casts = [
        'es_pagado' => 'boolean',
        'por_cobrar' => 'boolean',
        'abonado' => 'float',
        'monto' => 'float'
    ];

    public function colegiado()
    {
        return $this->belongsTo(Colegiado::class);
    }
}