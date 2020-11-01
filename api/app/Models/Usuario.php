<?php

namespace App\Models;

class Usuario extends \App\Model
{
    protected $table = 'usuario';
    protected $fillable = [
        'nombre',
        'clave',
        'rol_id',
        'token'
    ];
    protected $hidden = ['token','clave','updated_at','deleted_at'];

    public function rol()
    {
        return $this->belongsTo(Rol::class);
    }

    public function colegiado()
    {
        return $this->hasOne(Colegiado::class);
    }
}