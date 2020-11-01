app
	.component('colegiadoExperiencia',{
		templateUrl: './views/colegiado/experiencia/experiencia.view.html',
		controller: CtrlColegiadoExperiencia
	});

	CtrlColegiadoExperiencia.$inject = ['$scope','api.service','form.service','alert.service'];

	function CtrlColegiadoExperiencia(scope,api,form,alert) 
	{
		scope.view = {canEdit: false};
		Init = () => 
		{
            Load__List();
        }

        Load__List = () => {
            scope.spinner = true;
            api.list('colegiado/experiencia/lista')
            .then(res => scope.experiencias = res.data)
			.finally(fin => scope.spinner = false);
        };

		scope.openModal = (index,object = {}) => 
		{
			Clean();

			switch(index)
			{
				case 1:
					scope.modal.edit = false;
					scope.modal.title = "Agregar Experiencia Laboral";
					form.modal('edit');
				break;
				case 2:
					scope.modal.edit = true;
					scope.modal.title = "Editar Experiencia Laboral";
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
				promise = api.update('colegiado/experiencia',data);
			}else{
				promise = api.store('colegiado/experiencia',data);
			}

			promise.then(res => Process(res)).catch(error => ManagerError(error)).finally(fin => scope.modal.spinner = false);
		}

		scope.delete = (estudio) => 
		{
			scope.deleted = estudio;
			alert.confirm("¡Se eliminara la experiencia laboral seleccionada de la lista de estudios, esta operación es irreversible!",Delete);
		}

		Delete = () => 
		{
			scope.spinner_delete = true;

			api.delete('colegiado/experiencia',scope.deleted.id).then(res => {
				if(!res.data.success) return ManagerError(res.data.message);
				alert.success(res.data.message);
				Load__List();
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
			Load__List();
		}

		ManagerError = (error) => {
			alert.warning(error);
		}

		Clean = () => {
			scope.modal = {model: {},fails: {}};
		}

		Init();
	}