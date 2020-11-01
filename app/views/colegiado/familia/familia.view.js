app
	.component('colegiadoFamilia',{
		templateUrl: './views/colegiado/familia/familia.view.html',
		controller: CtrlColegiadoFamilia
	});

	CtrlColegiadoFamilia.$inject = ['$scope','api.service','form.service','alert.service'];

	function CtrlColegiadoFamilia(scope,api,form,alert) 
	{
		scope.view = {canEdit: false};
		Init = () => 
		{
            Parametros();
            Load__Familiares();
        }

        Load__Familiares = () => {
            scope.spinner = true;
			api.list('colegiado/familiar/lista').then(res => {
				scope.familiares = res.data;
			})
			.finally(fin => scope.spinner = false);
        };
        
        Parametros = () => {
            api.list('parametro/colegiado').then(res => {
                console.log('res',res);
                scope.tipos_documentos = res.data.tipos_documentos;
                scope.estados_civiles  = res.data.estados_civiles;
            });
        };

		scope.openModal = (index,object = {}) => 
		{
			Clean();

			switch(index)
			{
				case 1:
					scope.modal.edit = false;
					scope.modal.title = "Agregar Familiar";
					form.modal('edit');
				break;
				case 2:
					scope.modal.edit = true;
					scope.modal.title = "Editar Familiar";
                    scope.modal.model = angular.copy(object);
                    form.parse(scope.modal.model);
					form.modal('edit');
				break;
			}
		}

		scope.save = () => 
		{
			scope.modal.spinner = true;
            scope.modal.fails   = {};
            
            let data = form.validate(scope.modal.model);

			let promise;

			if(scope.modal.model.id){
				promise = api.update('colegiado/familiar',data);
			}else{
				promise = api.store('colegiado/familiar',data);
			}

			promise.then(res => Process(res)).catch(error => ManagerError(error)).finally(fin => scope.modal.spinner = false);
		}

		scope.delete = (familiar) => 
		{
			scope.deleted = familiar;
			alert.confirm("¡Se eliminara a " + familiar.nombres + " " + familiar.apellidos + " de la lista de familiares, esta operación es irreversible!",Delete);
		}

		Delete = () => 
		{
			scope.spinner_delete = true;

			api.delete('colegiado/familiar',scope.deleted.id).then(res => {
				if(!res.data.success) return ManagerError(res.data.message);
				alert.success(res.data.message);
				Load__Familiares();
			})
			.catch(error => ManagerError(error))
			.finally(fin => scope.spinner_delete = false);
		}

		Process = (res) => 
		{
			if(res.data.fails)
				return scope.modal.fails = res.data.fails;

			if(!res.data.success)
				return alert.warning(res.data.message);
			
			alert.success(res.data.message);
			form.modal('edit',false);
			Load__Familiares();
		}

		ManagerError = (error) => {
			alert.warning(error);
		}

		Clean = () => {
			scope.modal = {model: {},fails: {}};
		}

		Init();
	}