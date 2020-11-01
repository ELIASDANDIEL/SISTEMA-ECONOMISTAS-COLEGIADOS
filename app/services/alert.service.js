app.service('alert.service',AlertService);

AlertService.$inject = ['$http'];

function AlertService(http) 
{
	this.success = (message) => {
		Swal.fire({
			title: 'Correcto!',
			text: message,
			icon: 'success',
			showConfirmButton: false,
			timer: 1000
		});
	};
	this.warning = (message) => {
		Swal.fire({
			title: 'Atención!',
			text: message,
			icon: 'warning'
		});
	};
	this.confirm = (text,callback) => {
		Swal.fire({
		  	title: '¿Estas seguro?',
		  	text: text,
		  	icon: 'warning',
		  	showCancelButton: true,
		  	confirmButtonColor: '#3085d6',
		  	cancelButtonColor: '#d33',
		  	confirmButtonText: 'Confirmar',
		  	cancelButtonText: 'Cancelar'
		}).then((result) => 
		{
		  	if (result.value) {
			    callback()
		  	}
		})
	};
}