app
.component('formEstudio',{
    templateUrl: './forms/form-estudio/form-estudio.form.html',
    controller: formEstudioCtrl,
    bindings: {
        model: '=',
        postevent: '=',
        formid: '@'
    }
});

formEstudioCtrl.$inject = [
    '$scope',
    'api.service',
    'form.service',
    'alert.service'
];

function formEstudioCtrl(scope,api,form,alert) 
{
    ParametrosEstudios = () => {
        api.list('parametro/estudio').then(res => {
            scope.tipo_estudios = res.data.tipo_estudios;
        });
    };

    scope.saveEstudio = () => 
    {
        this.spinner = true;
        scope.fails   = {};
        
        let data = form.validate(this.model);

        let promise;

        if(this.model.id){
            promise = api.update('colegiado/estudio',data);
        }else{
            promise = api.store('colegiado/estudio',data);
        }

        promise
        .then(res => ProcessFormEstudio(res))
        .finally(fin => this.spinner = false);
    }

    ProcessFormEstudio = (res) => 
    {
        if(res.data.fails) return scope.fails = res.data.fails;

        if(!res.data.success) return alert.warning(res.data.message);
        
        alert.success(res.data.message);
        
        this.postevent();
    }

    ParametrosEstudios();
}