app
.component('adminColegiadosEstudios',{
    templateUrl: './views/admin/colegiados-estudios/colegiados-estudios.view.html',
    controller: adminColegiadosEstudiosCtrl
});

adminColegiadosEstudiosCtrl.$inject = ['$scope','api.service','form.service','alert.service'];

function adminColegiadosEstudiosCtrl(scope,api,form,alert) 
{
    Init = () => 
    {
        Colegiados();
    }

    Load__List = () => {
        scope.spinner = true;
        api.list('colegiado/estudio/lista/' + scope.colegiado_id)
        .then(res => scope.estudios = res.data)
        .finally(fin => scope.spinner = false);
    };

    Colegiados = () => 
    {
        scope.spinner = true;
        api.list('colegiado')
        .then(res => scope.colegiados = res.data)
        .finally(fin => scope.spinner = false);
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
                scope.modal.title = "Agregar Estudio";
                scope.modal.model = {
                    colegiado_id: scope.colegiado_id
                };
                form.modal('edit');
            break;
            case 2:
                scope.modal.edit = true;
                scope.modal.title = "Editar Estudio";
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

    scope.closeColegiadoModal = () => {
        form.modal('edit',false);
        Load__List();
    };

    scope.delete = (estudio) => 
    {
        scope.deleted = estudio;
        alert.confirm("¡Se eliminara los estudios en " + estudio.descripcion + " de la lista de estudios, esta operación es irreversible!",Delete);
    }

    Delete = () => 
    {
        scope.spinner_delete = true;

        api.delete('colegiado/estudio',scope.deleted.id).then(res => {
            if(!res.data.success) return alert.warning(res.data.message);
            alert.success(res.data.message);
            Load__List();
        })
        .finally(fin => scope.spinner_delete = false);
    }

    Clean = () => {
        scope.modal = {model: {},fails: {}};
    };

    Init();
}