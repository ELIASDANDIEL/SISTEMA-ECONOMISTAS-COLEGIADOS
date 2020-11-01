app
	.component('adminColegiadosHijos',{
		templateUrl: './views/admin/colegiados-hijos/colegiados-hijos.view.html',
		controller: adminColegiadosHijosCtrl
	});

	adminColegiadosHijosCtrl.$inject = ['$scope','api.service'];

	function adminColegiadosHijosCtrl(scope,api,form,alert) 
	{
        scope.hijos = [];
        scope.query = {
            edad_minima: 0,
            edad_maxima: 40
        };

        scope.searchHijos = () => 
        {
            scope.spinner = true;
            api
            .query('hijos',scope.query)
            .then(res => scope.hijos = res.data)
            .finally(() => scope.spinner = false);
        };

		scope.searchHijos();
	}