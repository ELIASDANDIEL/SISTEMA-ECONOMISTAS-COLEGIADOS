const TOKEN_KEY = 'colegiados_token_key'; 
const AUTH_KEY  = 'colegiados_user_key';

const app = angular.module('app',['ngRoute']);

app.config(Config);

Config.$inject    = ['$routeProvider','$locationProvider'];

function Config(route,location) 
{
	route
		.when('/',{template: '<home-inicio><home-inicio>'})
		
		//General
		.when('/cuenta',{template: '<cuenta><cuenta>'})

        //Admin - Mantenedores
		.when('/parametros',{template: '<parametros></parametros>'})
		//Admin - Colegiados
		.when('/admin-colegiados',{template: '<admin-colegiados></admin-colegiados>'})
		.when('/admin-colegiados-estudios',{template: '<admin-colegiados-estudios></admin-colegiados-estudios>'})
		.when('/admin-colegiados-familiares',{template: '<admin-colegiados-familiares></admin-colegiados-familiares>'})
		.when('/admin-colegiados-experiencia',{template: '<admin-colegiados-experiencia></admin-colegiados-experiencia>'})
		//Admin - Reportes
		.when('/admin-colegiados-hijos',{template: '<admin-colegiados-hijos></admin-colegiados-hijos>'})
		//Admin - Cobros
		.when('/mensualidades',{template: '<mensualidades></mensualidades>'})
		//Admin - Usuarios
		.when('/admin-usuario-clave',{template: '<admin-usuario-clave></admin-usuario-clave>'})

		//Colegiado - Datos Personales
		.when('/colegiado-datos',{template: '<colegiado-datos></colegiado-datos>'})
		.when('/colegiado-familia',{template: '<colegiado-familia></colegiado-familia>'})
		//Colegiado - Datos Profesionales
		.when('/colegiado-estudios',{template: '<colegiado-estudios></colegiado-estudios>'})
		.when('/colegiado-experiencia',{template: '<colegiado-experiencia></colegiado-experiencia>'})
		//Colegiado - Datos Pagos
		.when('/colegiado-mensualidad',{template: '<colegiado-mensualidad></colegiado-mensualidad>'})

	location.hashPrefix('');
};
