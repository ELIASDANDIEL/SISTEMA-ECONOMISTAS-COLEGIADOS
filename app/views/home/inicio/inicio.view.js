app
	.component('homeInicio',{
		templateUrl: './views/home/inicio/inicio.view.html',
		controller: ctrlHomeInicio
	});

	ctrlHomeInicio.$inject = ['$scope','$http','$location'];

	function ctrlHomeInicio(scope,http,location) 
	{
		scope.to = (index) => 
		{
			switch(index)
			{
				case 1:
					location.path('/admin-colegiados');
				break;
				case 2:
					location.path('/mensualidades');
				break;
				case 3:
					location.path('/colegiado-datos');
				break;
				case 4:
					location.path('/colegiado-mensualidad');
				break;
			}
		}
	}