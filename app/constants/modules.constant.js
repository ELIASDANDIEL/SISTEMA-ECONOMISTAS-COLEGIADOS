app
.constant('modules.constant',modulesConstant);

var options_admin = [
    {
        module: "Administrar",
        options: [
            // {
            //     id: 1,icon: 'cog',name: 'Configuración',title: 'Gestionar',
            //     options: [
            //         {name: 'Parametros',path: 'parametros'},
            //     ]
            // },
            {
                id: 2,icon: 'user-graduate',name: 'Colegiados',title: 'Gestionar',
                options: [
                    {name: 'Registro',path: 'admin-colegiados'},
                    {name: 'Estudios',path: 'admin-colegiados-estudios'},
                    {name: 'Experiencia Laboral',path: 'admin-colegiados-experiencia'},
                    {name: 'Familiares',path: 'admin-colegiados-familiares'},
                ]
            },
            {
                id: 3,icon: 'clipboard-list',name: 'Reportes',title: 'Filtrar',
                options: [
                    {name: 'Hijos de Colegiados',path: 'admin-colegiados-hijos'},
                ]
            },
            {
                id: 4,icon: 'users',name: 'Usuarios',title: 'Gestionar',
                options: [
                    {name: 'Cambiar Contraseñas',path: 'admin-usuario-clave'},
                ]
            }
        ]
    }
];

var options_colegiados = [
    {
        module: "Gestionar",
        options: [
            {
                id: 1,icon: 'user-edit',name: 'Datos Personales',title: 'Modificar',
                options: [
                    {name: 'Mis Datos',path: 'colegiado-datos'},
                    {name: 'Mi Familia',path: 'colegiado-familia'},
                ]
            },
            {
                id: 2,icon: 'user-graduate',name: 'Datos Profesionales',title: 'Registrar',
                options: [
                    {name: 'Estudios',path: 'colegiado-estudios'},
                    {name: 'Experiencia Laboral',path: 'colegiado-experiencia'},
                ]
            },
            // {
            //     id: 3,icon: 'money-check',name: 'Pagos',title: 'Registrar',
            //     options: [
            //         {name: 'Mensualidades',path: 'colegiado-mensualidad'},
            //     ]
            // }
        ]
    }
];

function modulesConstant() {

    let options = [];
    let auth = localStorage.getItem(AUTH_KEY);

    if(auth){
        let _auth = JSON.parse(auth);
        let rol_id = _auth.rol_id;

        switch(rol_id){
            case 1:
                options = options_admin;
            break;
            case 2:
                options = options_colegiados;
            break;
        }
    }

    let getRoutes = () => {
        let urls = ['/cuenta','/'];

        if(options.length == 0) return;

        options.forEach(module => {
            module.options.forEach(_option => {
                _option.options.forEach(suboption => {
                    urls.push('/'+suboption.path);
                })
            })
        });
        return urls;
    };

    return {
        options: options,
        urls: getRoutes()
    };
};