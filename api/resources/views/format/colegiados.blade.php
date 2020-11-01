<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .card-list{
            display: block;
            border: solid 1px gray;
            border-radius: 10px;
            margin-bottom: 10px;
            margin-top: 5px;
            width: 650px;
            height: 170px;
        }
        .card-list-item{
            padding: 5px;
            width: 300px;
            display: inline-block;
            font-size: 12px;
        }
    </style>
</head>
<body>
    <h2>CPEP - Lista de colegiados</h2>
    @foreach($colegiados as $key => $colegiado)
        <div class="card-list">
            <br>
            <div class="card-list-item">
                <h3>#{{$key + 1}}</h3>
                <span>Código: <strong>{{$colegiado->codigo}}</strong></span><br>
                <span>Nombres: <strong>{{$colegiado->nombres}}</strong></span><br>
                <span>Apellidos: <strong>{{$colegiado->apellidos}}</strong></span><br>
                <span>Cumpleaños: <strong>{{$colegiado->fecha_nacimiento}}</strong></span><br>
                <span>Universidad: <strong>{{$colegiado->universidad_procedencia}}</strong></span><br>
                <span>Dirección: <strong>{{$colegiado->direccion}}</strong></span><br>
                <span>Correo: <strong>{{$colegiado->correo}}</strong></span>
                <span>Celular: <strong>{{$colegiado->celular}}</strong></span><br>
                <span>Fijo: <strong>{{$colegiado->fijo}}</strong></span><br>
            </div>
            <div class="card-list-item">
                <span>Estado Civil: <strong>{{$colegiado->estadoCivil->nombre}}</strong></span><br>
                <span>Sexo: <strong>{{$colegiado->sexo}}</strong></span><br>
                <span>Tipo de documento: <strong>{{$colegiado->tipoDocumento->nombre}}</strong></span><br>
                <span>Número de documento: <strong>{{$colegiado->numero_documento}}</strong></span><br>
                <span>Estado: <strong>{{$colegiado->estado->nombre}}</strong></span><br>
                <span>País: <strong>{{$colegiado->pais->nombre}}</strong></span><br>
                <span>Departamento: <strong>{{$colegiado->departamento->nombre}}</strong></span><br>
                <span>Provincia: <strong>{{$colegiado->provincia->nombre}}</strong></span><br>
            </div>
        </div>
    @endforeach
</body>
</html>