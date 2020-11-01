app
.component('modal',{
    templateUrl: './components/modal/modal.component.html',
    controller: modalCtrl,
    bindings: {
        name: '@',
        title: '@',
        otherclass: '@',
        index: '@'
    },
    transclude: true
})

modalCtrl.$inject = [];

function modalCtrl(){

}