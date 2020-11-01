<?php

namespace App\Models;

class Familia extends \App\Model
{
    protected $table = 'familia';
    protected $fillable = [
        'nombres',
        'apellidos',
        'parentesco_id',
        'fecha_nacimiento',
        'numero_documento',
        'tipo_documento_id',
        'colegiado_id'
    ];

    public function parentesco()
    {
        return $this->belongsTo(Parentesco::class);
    }

    public function colegiado()
    {
        return $this->belongsTo(Colegiado::class);
    }

    public function tipoDocumento()
    {
        return $this->belongsTo(TipoDocumento::class);
    }
}
