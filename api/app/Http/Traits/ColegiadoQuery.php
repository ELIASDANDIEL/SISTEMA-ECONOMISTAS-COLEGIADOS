<?php 
namespace App\Http\Traits;

use App\Models\{Colegiado};

trait ColegiadoQuery
{
	public function colegiadoQuery($request)
	{
		$query = Colegiado::with('tipoDocumento','estadoCivil','estado','pais','departamento','provincia');

        if($request->nombres) $query = $query->where('nombres','like',"%{$request->nombres}%");

        if($request->apellidos) $query = $query->where('apellidos','like',"%{$request->apellidos}%");

        if($request->universidad_procedencia) $query = $query->where('universidad_procedencia','like',"%{$request->universidad_procedencia}%");

        if($request->direccion) $query = $query->where('direccion','like',"%{$request->direccion}%");

        if($request->correo) $query = $query->where('correo','like',"%{$request->correo}%");

        if($request->celular) $query = $query->where('celular','like',"%{$request->celular}%");

        if($request->fijo) $query = $query->where('fijo','like',"%{$request->fijo}%");

        if($request->numero_documento) $query = $query->where('numero_documento','like',"%{$request->numero_documento}%");

        if($request->estado_civil_id) $query = $query->where('estado_civil_id',$request->estado_civil_id);
        
        if($request->estado_id) $query = $query->where('estado_id',$request->estado_id);

        if($request->sexo) $query = $query->where('sexo',$request->sexo);

        if($request->pais_id) $query = $query->where('pais_id',$request->pais_id);

        if($request->departamento_id) $query = $query->where('departamento_id',$request->departamento_id);

        if($request->provincia_id) $query = $query->where('provincia_id',$request->provincia_id);

        if($request->con_hijos) $query = $query->whereHas('familiares',function ($q) {
                                                $q->where('parentesco_id',2);
                                            });

        $colegiados = $query->orderBy('codigo','asc')->get();

        $colegiados->each(function ($colegiado){
            $colegiado->nombre_completo = $colegiado->apellidos . " " . $colegiado->nombres;
        });
        $ordered = $colegiados->sortBy('nombre_completo');

        return $ordered->values()->all();
	}
}