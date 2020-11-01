app.service('api.service',ApiService);

ApiService.$inject = ['$http','$window'];

function ApiService(http,window) 
{
	const API      = '../api/public/index.php/api/';
	const token    = localStorage.getItem(TOKEN_KEY);
	const endPoint = '?api_token=' + token;

	this.list = (model) => {
		return Check(http.get(API + model + endPoint));
	}

	this.query = (route,data) => {
		return Check(http.post(API + route + '/query' + endPoint,data));
	};

	this.store = (model,data) => {
		return Check(http.post(API + model + '/store' + endPoint ,data));
	}

	this.update = (model,data) => {
		return Check(http.put(API + model + '/update/' + data.id + endPoint,data));
	}

	this.delete = (model,id) => {
		return Check(http.delete(API + model + '/delete/' + id + endPoint));
	}

	Check = (promise) => 
	{
		promise.catch(error => {
			if(error.status == 401)
				this.logout();
		});

		return promise;
	}

	this.logout = () => {
		localStorage.clear();
		window.location = '../login';
	}

	this.downloadPdf = function ( route, name , data ) 
    {
        return http({
            url: API + route + '/pdf' + endPoint,
            method: 'POST',
            params: data,
            headers: {
                'Content-type': "application/pdf",
            },
            responseType: 'blob'
        }).then(function (res) {

            var file = new Blob([res.data], {
                type: "application/pdf"
            });
            var fileURL = URL.createObjectURL(file);
            var a = document.createElement('a');
            a.href = fileURL;
            a.target = '_blank';
            a.download = name + '.pdf';
            document.body.appendChild(a);
            a.click();
        });    
	}
	
	this.downloadExcel = function(route,data)
    {
        let typeFile = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
        let extension = '.xlsx';

        return http({
            url: API + route + '/excel' + endPoint,
            method: 'POST',
            params: data,
            headers: {
                'Content-type': typeFile,
            },
            responseType: 'blob'
		})
		.then(res => {
			var file = new Blob([res.data], {
                type: typeFile
            });
            var fileURL = URL.createObjectURL(file);
            var a = document.createElement('a');
            a.href = fileURL;
            a.target = '_blank';
            a.download = route + extension;
            document.body.appendChild(a);
            a.click();
		});
    }
}