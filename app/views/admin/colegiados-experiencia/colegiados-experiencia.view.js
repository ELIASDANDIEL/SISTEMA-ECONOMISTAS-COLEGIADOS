app
.component('adminColegiadosExperiencia',{
    templateUrl: './views/admin/colegiados-experiencia/colegiados-experiencia.view.html',
    controller: adminColegiadosExperienciaCtrl
});

adminColegiadosExperienciaCtrl.$inject = ['$scope','api.service','form.service','alert.service'];

function adminColegiadosExperienciaCtrl(scope,api,form,alert) 
{
    Init = () => { Colegiados() }

    Load__List = () => {
        scope.spinner = true;
        api.list('colegiado/experiencia/lista/' + scope.colegiado_id)
        .then(res => scope.experiencias = res.data)
        .finally(fin => scope.spinner = false);
    };

    Colegiados = () => {
        scope.spinner = true;
        api.list('colegiado').then(res => {
            scope.colegiados = res.data;
        }).finally(fin => scope.spinner = false);
    };

    scope.select = (colegiado) => 
    {
        form.modal('colegiados',false);
        scope.colegiado_select = angular.copy(colegiado);
        scope.colegiado_id = colegiado.id;
        Load__List();
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
            case 3:
                scope.searchColegiado = null;
                form.modal('colegiados');
            break;
        }
    }

    scope.save = () => 
    {
        scope.modal.spinner = true;
        scope.modal.fails   = {};
        
        let data = form.validate(scope.modal.model);
            data.colegiado_id = scope.colegiado_id;

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