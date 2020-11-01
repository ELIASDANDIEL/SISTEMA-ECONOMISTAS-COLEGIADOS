app.controller('indexCtrl',IndexCtrl);
IndexCtrl.$inject = [
	'$scope',
	'api.service',
	'$anchorScroll',
	'$rootScope',
	'modules.constant'
];

function IndexCtrl(scope,api,scroll,root,cModules) 
{;
	scope.navbar = {
		modules: cModules().options
	};

	Init = () => 
	{
		let token = localStorage.getItem(TOKEN_KEY);
		let user  = localStorage.getItem(AUTH_KEY);

		if(!token)	
			return api.logout();

		try{
			scope.auth = JSON.parse(user);
			root.auth  = scope.auth;
			console.log('auth',scope.auth);
		}catch(error){
			api.logout();
		}
	};

	root.top = function () {
		scroll("wrapper");
	}

	scope.logout = () => 
	{
		api.logout();
	};

	Init();
};

