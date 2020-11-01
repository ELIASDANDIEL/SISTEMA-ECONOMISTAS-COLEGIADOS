app.service('form.service',FormService);

FormService.$inject = ['$filter'];

function FormService(filter) 
{
	this.modal = (name,action = true) => 
	{
		let form = $('#modal_'+name);

		if(action)
			form.modal('show');
		else
			form.modal('hide');
	}

	this.validate = function(dataForm){
        let new_form_data = {};
        angular.forEach(dataForm,function(value,key){
            if(angular.isDate(value)){
            	new_form_data[key] = (key.indexOf("hora") >= 0) ? filter('date')(value, 'HH:mm','America/Lima') : filter('date')(value, 'yyyy-MM-dd','America/Lima');
            	return;
            }
            if(angular.isUndefined(value)){
                new_form_data[key] = "";
                return;
            }
            new_form_data[key] = value;
        });
        return new_form_data;
    };

    this.parse = function(valor)
    {
        angular.forEach(valor,function(value,key){
	        if( key.indexOf("fecha") >= 0   || key.indexOf("hora") >= 0 ){
	            if(navigator.userAgent.search("Chrome") >= 0){
	                if(key.indexOf("hora") >= 0){
	                    var tiempo = new Date(filter('date')('1970-01-01 '+value, 'hh:mm','America/Lima'));
	                    valor[key] = tiempo;
	                }
	                if(key.indexOf('fecha') >= 0){
	                    if(value){
	                        var fecha =  new Date(filter('date')(value, 'yyyy/MM/dd','America/Lima'));
	                        valor[key] = fecha;
	                    }
	                }
	            }else{
	                valor[key] =  $filter('date')(value, 'yyyy/MM/dd','America/Lima');
	            }
	        }
        });
    };
}