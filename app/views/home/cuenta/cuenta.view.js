app
	.component('cuenta',{
		templateUrl: './views/home/cuenta/cuenta.view.html',
		controller: CtrlCuenta
	});

	CtrlCuenta.$inject = ['$scope','api.service','form.service','alert.service'];

	function CtrlCuenta(scope,api,form,alert) 
	{
		Init = () => 
		{
			Clean();
			User();
		}

		User = () => 
		{
			scope.spinner = true;
			api.list('usuario/auth').then(res => scope.usuario = res.data.usuario)
			.finally(fin => scope.spinner = false);
		}

		Clean = () => 
		{
			scope.model = {};
		}

		scope.save = () => 
		{
			if(!scope.model.password) return alert.warning("Por favor complete el campo 'Nueva Contraseña'.");
			if(!scope.model.password_confirm) return alert.warning("Por favor complete el campo 'Confirme Contraseña'.");
			if(scope.model.password != scope.model.password_confirm) return alert.warning("Las contraseñas no coinciden.");

			scope.spinner_pass = true;

			api.store('usuario/password',scope.model).then(res => {
				if(!res.data.success) return alert.warning(res.data.message);

				alert.success(res.data.message);
				Clean();
			})
			.finally(fin => scope.spinner_pass = false);
		}

		Init();
	}