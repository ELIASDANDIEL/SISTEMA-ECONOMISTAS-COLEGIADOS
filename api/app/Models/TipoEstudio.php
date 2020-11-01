<?php

namespace App\Models;

class TipoEstudio extends \App\Model
{
    protected $table = 'tipo_estudio';
    protected $fillable = [
        'nombre'
    ];
    public function estudios()
    {
        return $this->hasMany(Estudio::class);
    }
}