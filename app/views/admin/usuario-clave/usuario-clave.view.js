app
	.component('adminUsuarioClave',{
		templateUrl: './views/admin/usuario-clave/usuario-clave.view.html',
		controller: adminUsuarioClaveCtrl
	});

	adminUsuarioClaveCtrl.$inject = ['$scope','api.service','form.service','alert.service'];

	function adminUsuarioClaveCtrl(scope,api,form,alert) 
	{
        Init = () => {
            Load__Usuarios();
        }

        Load__Usuarios = () => {
            scope.spinner = true;
            api
            .list('usuario/list')
            .then(res => scope.usuarios = res.data)
            .finally(fin => scope.spinner = false);
        };

        scope.openModal = (name,object = {}) => {
            scope.modal = {name: name};
            switch(name)
            {
                case 'clave':
                    scope.modal.model = {
                        id: object.id
                    };
                break;
            }
            form.modal('clave',true);
        }

        scope.savePassword = () => {
            if(scope.modal.model.clave != scope.modal.model.repetir_clave)
                return alert.warning("Las contraseñas no coinciden");

            scope.modal.spinner = true;

            api
            .update('usuario/clave',scope.modal.model)
            .then(res => {
                if(!res.data.success) return alert.warning(res.data.message);

                alert.success(res.data.message);

                form.modal('clave',false);
            })
            .finally(() => scope.modal.spinner = false);
        };

		Init();
	}