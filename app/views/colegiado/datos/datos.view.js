app
.component('colegiadoDatos',{
    templateUrl: './views/colegiado/datos/datos.view.html',
    controller: CtrlColegiadoDatos
});

CtrlColegiadoDatos.$inject = ['$scope','api.service','form.service','alert.service'];

function CtrlColegiadoDatos(scope,api,form,alert) 
{
    Init = () => 
    {
        Load__Parametros();
        Load__Data();
    }

    Load__Data = () => {
        scope.spinner = true;
        api.list('usuario/colegiado')
        .then(res => {
            scope.model = res.data;
            form.parse(scope.model);
        })
        .finally(fin => scope.spinner = false);
    };

    Load__Parametros = () => {
        api.list('parametro/colegiado').then(res => {
            console.log('res',res);
            scope.tipos_documentos = res.data.tipos_documentos;
            scope.estados_civiles  = res.data.estados_civiles;
        });
    };

    scope.save = () => {
        scope.spinner_save = true;
        scope.fails   = {};
        
        let data = form.validate(scope.model);

        api
        .update('colegiado',data)
        .then(res => {
            if(res.data.fails) return scope.modal.fails = res.data.fails;

			if(!res.data.success) return alert.warning(res.data.message);
			
			alert.success(res.data.message);
			Load__Data();
        })
        .finally(fin => scope.spinner_save = false);;
    };

    Init();
}