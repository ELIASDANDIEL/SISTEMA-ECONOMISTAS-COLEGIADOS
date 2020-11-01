<?php

namespace App\Models;

class Provincia extends \App\Model
{
    protected $table = 'provincia';
    protected $fillable = [
        'nombre',
        'departamento_id'
    ];

    public function departamento()
    {
        return $this->belongsTo(Departamento::class);
    }
}