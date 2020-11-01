<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromCollection;
use Illuminate\Database\Eloquent\Collection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use App\Models\{Colegiado};

class ColegiadoExport implements FromCollection,WithHeadings
{
    public $data;

    public function __construct($data)
    {
        $this->data = $data;
    }

    public function collection()
    {
        $list = collect();

        if(count($this->data) > 0){
            $key = 0;
            foreach ($this->data as $colegiado) {
                $list->push([
                    'index' => $key + 1,
                    'codigo' => $colegiado->codigo,
                    'nombres' => $colegiado->nombres,
                    'apellidos' => $colegiado->apellidos,
                    'fecha_nacimiento' => $colegiado->fecha_nacimiento,
                    'universidad_procedencia' => $colegiado->universidad_procedencia,
                    'direccion' => $colegiado->direccion,
                    'correo' => $colegiado->correo,
                    'celular'=> $colegiado->celular,
                    'fijo' => $colegiado->fijo,
                    'estado_civil' => $colegiado->estadoCivil->nombre,
                    'sexo' => $colegiado->sexo,
                    'tipo_documento' => $colegiado->tipoDocumento->nombre,
                    'numero_documento' => $colegiado->numero_documento,
                    'estado' => $colegiado->estado->nombre,
                    'pais' => $colegiado->pais->nombre,
                    'departamento' => $colegiado->departamento->nombre,
                    'provincia' => $colegiado->provincia->nombre,
                ]);
                $key++;
            }
        }

        return new Collection($list);
    }

    public function headings(): array
    {
        return [
            '#',
            'Código',
            'Nombres',
            'Apellidos',
            'Fecha Nacimiento',
            'Universidad',
            'Dirección',
            'Correo',
            'Celular',
            'Fijo',
            'Estado Civil',
            'Sexo',
            'Tipo Documento',
            'Número Documento',
            'Estado',
            'País',
            'Departamento',
            'Provincia'
        ];
    }
}