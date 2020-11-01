app
.component('colegiadoMensualidad',{
    templateUrl: './views/colegiado/mensualidad/mensualidad.view.html',
    controller: CtrlColegiadoMensualidad
});

CtrlColegiadoMensualidad.$inject = ['$scope','api.service','form.service','alert.service'];

function CtrlColegiadoMensualidad(scope,api,form,alert) 
{
    Init = () => 
    {
        scope.spinner = true;
        api.list('colegiado/mensualidad').then(res => {
            scope.mensualidades = res.data.mensualidades;
            scope.deuda         = res.data.deuda;
        })
        .finally(fin => scope.spinner = false);
    }

    // scope.generarMensualidadesDelMes = () => {
    //     scope.spinner = true;
    //     scope.spinner_text = "generarando mensualidades";
    //     api.list('mensualidad/mes-generar').then(res => {
    //         if(!res.data.success) return alert.warning(res.data.message);
    //         alert.success(res.data.message);
    //         Init();
    //     })
    //     .finally(fin => scope.spinner = false);
    // };

    scope.openModal = (name,object) => 
    {
        scope.modal = {name: name};
        switch(name)
        {
            case 'pago':

            break;
            // case 'cronograma':
            //     scope.modal.title = "Mensualidades";
            //     scope.modal.spinner = true;
            //     api.list('mensualidad/detalle/'+object.id).then(res => {
            //         scope.modal.mensualidades = res.data;
            //     })  
            //     .finally(fin => scope.modal.spinner = false);
            // break;
        }
        form.modal(scope.modal.name,true);
    };

    Init();
}