<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\{Familia};
use Carbon\Carbon;

class ReporteCtrl extends Controller
{
    public function hijos(Request $request)
    {
        $fecha_maxima = Carbon::now();
        $fecha_maxima->modify("-{$request->edad_minima} years");

        $fecha_minima = Carbon::now();
        $fecha_minima->modify("-{$request->edad_maxima} years");

        $hijos = Familia::with('colegiado')
                        ->whereDate('fecha_nacimiento','>=',$fecha_minima->toDateString())
                        ->whereDate('fecha_nacimiento','<=',$fecha_maxima->toDateString())
                        ->get();
        $hijos->each(function ($hijo)
        {
            $hijo->colegiado_codigo = $hijo->colegiado->codigo;
            $hijo->colegiado_nombres = $hijo->colegiado->nombres;
            $hijo->colegiado_apellidos = $hijo->colegiado->apellidos;
        }); 

        $ordered = $hijos->sortBy('colegiado_codigo');

        return $ordered->values()->all();
    }
}