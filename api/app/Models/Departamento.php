<?php

namespace App\Models;

class Departamento extends \App\Model
{
    protected $table = 'departamento';
    protected $fillable = [
        'nombre',
        'pais_id'
    ];

    public function pais()
    {
        return $this->belongsTo(Pais::class);
    }

    public function provincias()
    {
        return $this->hasMany(Provincia::class);
    }
}