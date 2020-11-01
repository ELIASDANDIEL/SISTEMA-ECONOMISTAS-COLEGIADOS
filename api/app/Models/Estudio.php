<?php

namespace App\Models;

class Estudio extends \App\Model
{
    protected $table = 'estudio';
    protected $fillable = [
        'descripcion',
        'anio_egreso',
        'duracion_meses',
        'colegiado_id',
        'es_culminado',
        'tipo_estudio_id',
    ];
    protected $casts = [
        'es_culminado' => 'boolean'
    ];

    public function colegiado()
    {
        return $this->belongsTo(Colegiado::class);
    }

    public function tipoEstudio()
    {
        return $this->belongsTo(TipoEstudio::class);
    }
}
