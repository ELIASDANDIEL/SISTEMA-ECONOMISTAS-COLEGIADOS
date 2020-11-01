<?php

namespace App\Models;

class Colegiado extends \App\Model
{
    protected $table = 'colegiado';
    protected $fillable = [
        'codigo',
        'nombres',
        'apellidos',
        'fecha_nacimiento',
        'universidad_procedencia',
        'direccion',
        'correo',
        'celular',
        'fijo',
        'numero_documento',
        'estado_civil_id',
        'tipo_documento_id',
        'usuario_id',
        'estado_id',
        'enabled',
        'deuda',
        'sexo',
        'pais_id',
        'departamento_id',
        'provincia_id'
    ];
    protected $casts = [
        'enabled' => 'boolean',
        'deuda' => 'float'
    ];

    public function estadoCivil()
    {
    	return $this->belongsTo(EstadoCivil::class);
    }

    public function tipoDocumento()
    {
        return $this->belongsTo(TipoDocumento::class);
    }

    public function estado()
    {
        return $this->belongsTo(Estado::class);
    }

    public function experienciaLaboral()
    {
        return $this->hasMany(Experiencia::class);
    }

    public function estudios()
    {
        return $this->hasMany(Estudio::class);
    }

    public function familiares()
    {
        return $this->hasMany(Familia::class);
    }

    public function usuario()
    {
        return $this->belongsTo(Usuario::class);
    }

    public function pais()
    {
        return $this->belongsTo(Pais::class);
    }

    public function departamento()
    {
        return $this->belongsTo(Departamento::class);
    }

    public function provincia()
    {
        return $this->belongsTo(Provincia::class);
    }
}
