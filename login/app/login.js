login
	.controller('loginCtrl',LoginCtrl);

	LoginCtrl.$inject = ['$scope','$http','$window'];

	function LoginCtrl(scope,http,window) 
	{
		const config = 
		{
			API: '../api/public/index.php/api/',
			KEY: 'colegiados_token_key',
			KEY_USER: 'colegiados_user_key',
			HOME: '../app/'
		};

		Init = () => 
		{
			CheckToken();
			Clean();
		};

		CheckToken = () => 
		{
			let token = localStorage.getItem(config.KEY);
			if(token)
				window.location = config.HOME;
		}

		Clean = () => 
		{
			scope.model = {};
		};

		Authenticate = (data) => 
		{
			localStorage.setItem(config.KEY,data.token);
			localStorage.setItem(config.KEY_USER,JSON.stringify(data.usuario));
			window.location = config.HOME;
		}

		scope.login = () => 
		{
			if(!scope.model.usuario) return;
			if(!scope.model.clave) return;

			scope.error   = null;
			scope.spinner = true;

			http
				.post(config.API + 'login',scope.model)
				.then(res => 
				{
					if(!res.data.success){
						return Swal.fire({
						  icon: 'warning',
						  text: res.data.message
						})
					}

					Authenticate(res.data);
				})
				.catch(error => {
					scope.error = error;
				})
				.finally(fin => {
					scope.spinner = false;
				})
		};

		scope.toPublic = () => 
		{
			window.location.href = '../consultas/';
		}

		Init();
	}