<?php

use Illuminate\Support\Facades\Route;

Route::post('login','UsuarioCtrl@login');
Route::get('colegiado/consulta/{codigo}','PublicoCtrl@consultaColegiado');

Route::group(['middleware' => 'miauth'],function()
{
    Route::group(['prefix' => 'usuario'],function (){
        Route::get('auth','UsuarioCtrl@auth');
        Route::post('password/store','UsuarioCtrl@storePassword');
        Route::get('colegiado','UsuarioCtrl@colegiado');

        Route::get('list','UsuarioCtrl@list');
        Route::put('clave/update/{id}','UsuarioCtrl@updatePassword');
	});

    Route::group(['prefix' => 'parametro'],function (){
		Route::get('','ParametroCtrl@index');
        Route::put('update/{id}','ParametroCtrl@update');

        Route::get('colegiado','ParametroCtrl@colegiado');
        Route::get('estudio','ParametroCtrl@estudio');
    });
    
    Route::group(['prefix' => 'colegiado'],function (){
        Route::get('','ColegiadoCtrl@index');
        Route::post('store','ColegiadoCtrl@store');
        Route::put('update/{id}','ColegiadoCtrl@update');
        Route::delete('delete/{id}','ColegiadoCtrl@delete');
        Route::post('query','ColegiadoCtrl@query');
        Route::post('excel','ExportCtrl@exportColegiadosExcel');
        Route::post('pdf','ExportCtrl@exportColegiadosPdf');

        #familiares
        Route::group(['prefix' => 'familiar'],function ()
        {
            Route::get('lista/{colegiado_id}','FamiliarCtrl@getForColegiado');
            Route::get('lista','FamiliarCtrl@index');
            Route::post('store','FamiliarCtrl@store');
            Route::put('update/{id}','FamiliarCtrl@update');
            Route::delete('delete/{id}','FamiliarCtrl@delete');
        });
        #estudios
        Route::group(['prefix' => 'estudio'],function ()
        {
            Route::get('lista/{colegiado_id}','EstudioCtrl@getForColegiado');
            Route::get('lista','EstudioCtrl@index');
            Route::post('store','EstudioCtrl@store');
            Route::put('update/{id}','EstudioCtrl@update');
            Route::delete('delete/{id}','EstudioCtrl@delete');
        });
        #experiencia
        Route::group(['prefix' => 'experiencia'],function ()
        {
            Route::get('lista/{colegiado_id}','ExperienciaCtrl@getForColegiado');
            Route::get('lista','ExperienciaCtrl@index');
            Route::post('store','ExperienciaCtrl@store');
            Route::put('update/{id}','ExperienciaCtrl@update');
            Route::delete('delete/{id}','ExperienciaCtrl@delete');
        });
        #mensualidad
        Route::get('mensualidad','ColegiadoCtrl@mensualidades');
    });

    Route::group(['prefix' => 'mensualidad'],function ()
    {
        Route::get('','MensualidadCtrl@index');
        Route::get('mes-generar','MensualidadCtrl@generarMensualidadesDelMes');
        Route::get('detalle/{colegiado_id}','MensualidadCtrl@detalle');
        Route::post('pagar/store','MensualidadCtrl@pagar');
    });

    #Reportes
    Route::post('hijos/query','ReporteCtrl@hijos');
});