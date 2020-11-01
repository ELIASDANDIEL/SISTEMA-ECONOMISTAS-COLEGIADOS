<?php

namespace App\Models;

class Parentesco extends \App\Model
{
    protected $table = 'parentesco';
    protected $fillable = [
        'nombre',
        'es_hijo',
        'es_pareja'
    ];
    protected $casts = [
        'es_hijo' => 'boolean',
        'es_pareja' => 'boolean'
    ];
}