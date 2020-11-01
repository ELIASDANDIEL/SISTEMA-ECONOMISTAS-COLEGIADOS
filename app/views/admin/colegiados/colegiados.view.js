app
	.component('adminColegiados',{
		templateUrl: './views/admin/colegiados/colegiados.view.html',
		controller: adminColegiadosCtrl
	});

	adminColegiadosCtrl.$inject = ['$scope','api.service','form.service','alert.service'];

	function adminColegiadosCtrl(scope,api,form,alert) 
	{
		scope.query = {};

		scope.paises = [];
		scope.query_departamentos = [];
		scope.query_provincias = [];
		scope.model_departamentos = [];
		scope.model_provincias = [];

		Init = () => 
		{
            scope.spinner = true;
            Parametros();
			Colegiados();
        };
        
        Parametros = () => {
            api.list('parametro/colegiado').then(res => {
                console.log('res',res);
                scope.tipos_documentos   = res.data.tipos_documentos;
				scope.estados_civiles    = res.data.estados_civiles;
				scope.estados_colegiados = res.data.estados_colegiados;
				scope.paises             = res.data.paises;
            });
        };

		Colegiados = () => 
		{
			scope.spinner = true;
			scope.spinner_text = "cargando lista";
			api.query('colegiado',scope.query).then(res => {
				console.log('res',res);
				scope.colegiados = res.data;
			})
			.finally(fin => scope.spinner = false);
		};

		scope.searchColegiados = () => {
			console.log('query',scope.query);
			Colegiados();
		};

		scope.openModal = (name,object = {}) => 
		{
			scope.modal = {name: name};

			switch(name)
			{
				case 'add-colegiado':
					let d = new Date();
					let n = d.getMilliseconds();
					scope.modal.name = 'colegiado';
					scope.modal.edit = false;
					scope.modal.title = "Agregar Colegiado";
					scope.modal.model = {
						// nombres: "Miguel",
						// apellidos: "ECa",
						// fecha_nacimiento: new Date(),
						// universidad_procedencia: "ASAS",
						// direccion: "Sadddads",
						// correo: n+"miguelecaing@gmail.com",
						// celular: "182391723",
						// fijo: "1238238",
						// estado_civil_id: 1,
						// tipo_documento_id: 1,
						// numero_documento: n+'12371237',
						// estado_id: 1,
						// sexo: "M",
						// pais_id: 1,
						// departamento_id: 1,
						// provincia_id: 1
					};
				break;
				case 'edit-colegiado':
					scope.modal.name = 'colegiado';
					scope.modal.edit = true;
					scope.modal.title = "Editar Colegiado";
                    scope.modal.model = angular.copy(object);
                    form.parse(scope.modal.model);
				break;
				case 'add-estudio':
					scope.modal.name = 'estudio';
					scope.modal.edit = false;
					scope.modal.title = "Agregar Estudio";
					scope.modal.model = {};
				break;
			}
			form.modal(scope.modal.name);
		}

		scope.openColegiadoSecondModal = (name) => {
			scope.secondmodal = {name: name,model: {
				colegiado_id: scope.modal.colegiado.id
			}};
			// form.modal('opciones',false);
			form.modal(scope.secondmodal.name);
		};
		scope.closeColegiadoSecondModal = () => {
			form.modal(scope.secondmodal.name,false);
			form.modal('opciones',true);
		};

		scope.save = () => 
		{
			scope.modal.spinner = true;
            scope.modal.fails   = {};
            
            let data = form.validate(scope.modal.model);

			let promise;

			if(scope.modal.model.id){
				promise = api.update('colegiado',data);
			}else{
				promise = api.store('colegiado',data);
			}

			promise
			.then(res => ProcessColegiado(res))
			.finally(() => scope.modal.spinner = false);
		}

		ProcessColegiado = (res) => 
		{
			console.log('res',res)

			if(res.data.fails) return scope.modal.fails = res.data.fails;

			if(!res.data.success) return alert.warning(res.data.message);
			
			alert.success(res.data.message);
			form.modal('colegiado',false);

			Colegiados();

			if(scope.modal.edit == false){
				scope.modal.colegiado = res.data.model;
				form.modal('opciones');
			}
		};

		scope.downloadExcel = () => {
			scope.spinner = true;
			scope.spinner_text = "exportando a excel";
			api.downloadExcel('colegiado',scope.query).finally(()=> scope.spinner = false);
		};

		scope.downloadPdf = () => {
			scope.spinner = true;
			scope.spinner_text = "exportando a pdf";
			api.downloadPdf('colegiado','colegiados',scope.query).finally(()=> scope.spinner = false);
		}

		scope.$watch('query.pais_id',new_value => {
			if(new_value){
				let found = scope.paises.find(p => p.id == new_value);
				scope.query_departamentos = found.departamentos;
			}
		});
		scope.$watch('query.departamento_id',new_value => {
			if(new_value){
				let found = scope.query_departamentos.find(d => d.id == new_value);
				scope.query_provincias = found.provincias;
			}
		});
		scope.$watch('modal.model.pais_id',new_value => {
			if(new_value){
				let found = scope.paises.find(p => p.id == new_value);
				scope.model_departamentos = found.departamentos;
			}
		});
		scope.$watch('modal.model.departamento_id',new_value => {
			if(new_value){
				let found = scope.model_departamentos.find(d => d.id == new_value);
				scope.model_provincias = found.provincias;
			}
		});

		Init();
	}