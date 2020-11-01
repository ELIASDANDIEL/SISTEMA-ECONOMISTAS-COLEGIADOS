var app = angular.module('app',[]);

app
.controller('index',function ($scope,$http,$window) 
{
	const scope = $scope;

	scope.model = {};

	scope.consultar = () => 
	{
		scope.verify  = false;
		scope.spinner = true;

		$http
		.get('../api/public/index.php/api/colegiado/consulta/' + scope.model.codigo)
		.then(res => 
		{
			if(!res.data.success){
				return Swal.fire({
				  icon: 'warning',
				  text: res.data.message
				});
			};
			scope.colegiado = res.data.info;
			scope.option_id   = 1;
			scope.codigo      = scope.model.codigo;
			scope.verify      = true;
		})
		.catch(error => {
			alert(error);
		})
		.finally(fin => scope.spinner = false);
	};

	scope.toLogin = () => 
	{
		window.location.href = '../login/';
	}

});