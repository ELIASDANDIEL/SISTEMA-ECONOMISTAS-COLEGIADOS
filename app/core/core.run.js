app
.run(Run);

Run.$inject = ['modules.constant','$rootScope','$location'];

function Run(cModules,root,location) 
{
	root.$on('$routeChangeStart', change);

	function change(event, next) 
    {
        // console.log('next',next);
        if (angular.isDefined(next.$$route)) {

            let path = next.$$route.originalPath;

            let change = false;
            let urls = cModules().urls;

            if(urls.length === 0){
				change = true;
			}else{
                angular.forEach(urls,(value)=> {
                    if(angular.equals(path,value)) change = true;
                });
			}
			
            if(!change)	location.path('/');
        } 
    }
};