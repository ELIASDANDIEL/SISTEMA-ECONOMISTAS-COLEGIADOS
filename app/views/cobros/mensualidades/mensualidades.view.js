app
.component('mensualidades',{
    templateUrl: './views/cobros/mensualidades/mensualidades.view.html',
    controller: CtrlMensualidades
});

CtrlMensualidades.$inject = ['$scope','api.service','form.service','alert.service'];

function CtrlMensualidades(scope,api,form,alert) 
{
    Init = () => 
    {
        scope.spinner = true;
        api.list('mensualidad').then(res => {
            scope.colegiados        = res.data.colegiados;
            scope.fecha_ultima_mensualidad = res.data.fecha_ultima_mensualidad;
        })
        .finally(fin => scope.spinner = false);
    }

    Load__Mensualidades = () => {
        scope.modal.spinner = true;
        api.list('mensualidad/detalle/'+scope.modal.id).then(res => {
            scope.modal.mensualidades = res.data;
        })  
        .finally(fin => scope.modal.spinner = false);
    };

    scope.generarMensualidadesDelMes = () => {
        scope.spinner = true;
        scope.spinner_text = "generarando mensualidades";
        api.list('mensualidad/mes-generar').then(res => {
            if(!res.data.success) return alert.warning(res.data.message);
            alert.success(res.data.message);
            Init();
        })
        .finally(fin => scope.spinner = false);
    };

    scope.openModal = (name,object = {}) => 
    {
        scope.modal = {name: name};
        switch(name)
        {
            case 'cronograma':
                scope.modal.title = "Mensualidades";
                scope.modal.id    = object.id;
                Load__Mensualidades();
            break;
        }
        form.modal(scope.modal.name,true);
    };

    scope.openSecondModal = (name, object = {}) => 
    {
        scope.secondmodal = {name: name};
        switch(name)
        {
            case 's-pago':
                scope.secondmodal.title = "Registrar Pago";
                scope.secondmodal.model = angular.copy(object);
            break;
        }
        form.modal(scope.secondmodal.name,true);
    };

    scope.pagar = () => 
    {
        scope.secondmodal.spinner = true;
        let data = {
            id: scope.secondmodal.model.id,
            numero_referencia: scope.secondmodal.model.numero_referencia
        }
        api
        .store('mensualidad/pagar',data)
        .then(res => {
            if(!res.data.success) return alert.warning(res.data.message);
            alert.success(res.data.message);
            form.modal(scope.secondmodal.name,false);
            Load__Mensualidades();
            Init();
        })
        .finally(fin => scope.secondmodal.spinner = false)
    };

    Init();
}