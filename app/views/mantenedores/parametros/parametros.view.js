app
	.component('parametros',{
		templateUrl: './views/mantenedores/parametros/parametros.view.html',
		controller: CtrlParametros
	});

	CtrlParametros.$inject = ['$scope','api.service','form.service','alert.service'];

	function CtrlParametros(scope,api,form,alert) 
	{
		Init = () => 
		{
			scope.spinner = true;
			api.list('parametro').then(res => scope.parametros = res.data.parametros)
			.finally(fin => scope.spinner = false);
		}

		scope.openModal = (object = {}) => 
		{
			Clean();
			scope.modal.edit = true;
			scope.modal.title = "Editar " + object.nombre;
			scope.modal.model = angular.copy(object);
			form.modal('edit');
		}

		scope.save = () => 
		{
			scope.modal.spinner = true;
			scope.modal.fails   = {};
			api
			.update('parametro',scope.modal.model)
			.then(res => Process(res))
			.catch(error => ManagerError(error))
			.finally(fin => scope.modal.spinner = false);
		}

		Process = (res) => 
		{
			if(res.data.fails)
				return scope.modal.fails = res.data.fails;

			if(!res.data.success)
				return alert.warning(res.data.message);
			
			alert.success(res.data.message);
			form.modal('edit',false);
			Init();
		}

		ManagerError = (error) => {
			alert.warning(error);
		}

		Clean = () => {
			scope.modal = {model: {},fails: {}};
		}

		Init();
	}