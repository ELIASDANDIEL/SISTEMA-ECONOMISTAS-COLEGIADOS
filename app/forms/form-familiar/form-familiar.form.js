app
.component('formFamiliar',{
    templateUrl: './forms/form-familiar/form-familiar.form.html',
    controller: formFamiliarCtrl,
    bindings: {
        model: '=',
        postevent: '=',
        formid: '@'
    }
});

formFamiliarCtrl.$inject = [
    '$scope',
    'api.service',
    'form.service',
    'alert.service'
];

function formFamiliarCtrl(scope,api,form,alert) 
{
    ParametrosFamiliar = () => {
        api.list('parametro/colegiado').then(res => {
            console.log('res',res);
            scope.tipos_documentos = res.data.tipos_documentos;
            scope.estados_civiles  = res.data.estados_civiles;
            scope.parentescos      = res.data.parentescos;
        });
    };

    scope.saveFamiliar = () => 
    {
        this.spinner = true;
        scope.fails   = {};
        
        let data = form.validate(this.model);

        let promise;

        if(this.model.id){
            promise = api.update('colegiado/familiar',data);
        }else{
            promise = api.store('colegiado/familiar',data);
        }

        promise
        .then(res => ProcessFormFamiliar(res))
        .finally(fin => this.spinner = false);
    }

    ProcessFormFamiliar = (res) => 
    {
        if(res.data.fails) return scope.fails = res.data.fails;

        if(!res.data.success) return alert.warning(res.data.message);
        
        alert.success(res.data.message);
        
        this.postevent();
    }

    ParametrosFamiliar();
}