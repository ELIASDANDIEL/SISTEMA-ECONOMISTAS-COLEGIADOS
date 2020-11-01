app
.component('formExperiencia',{
    templateUrl: './forms/form-experiencia/form-experiencia.form.html',
    controller: formExperienciaCtrl,
    bindings: {
        model: '=',
        postevent: '=',
        formid: '@'
    }
});

formExperienciaCtrl.$inject = [
    '$scope',
    'api.service',
    'form.service',
    'alert.service'
];

function formExperienciaCtrl(scope,api,form,alert) 
{
    scope.saveExperiencia = () => 
    {
        this.spinner = true;
        scope.fails   = {};
        
        let data = form.validate(this.model);

        let promise;

        if(this.model.id){
            promise = api.update('colegiado/experiencia',data);
        }else{
            promise = api.store('colegiado/experiencia',data);
        }

        promise
        .then(res => ProcessFormExperiencia(res))
        .finally(fin => this.spinner = false);
    }

    ProcessFormExperiencia = (res) => 
    {
        if(res.data.fails) return scope.fails = res.data.fails;

        if(!res.data.success) return alert.warning(res.data.message);
        
        alert.success(res.data.message);
        
        this.postevent();
    }
}