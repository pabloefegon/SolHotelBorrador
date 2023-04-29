//variables para funcionalidad del icono de menu
let variableBotonMenu = document.querySelector('.boton-menu');
let variableIconoBarras = document.querySelector('.boton-menu i');
let variableMenuNav = document.querySelector('header nav');
var booleanMenu = true;


//variables para funcionalidad del boton de instrucciones
let variableInstruccionesComando = document.querySelector(".instrucciones-comando");
let variableInstruccionesParrafo = document.querySelector(".instrucciones-parrafo");
let variableBoolean = true;

//variables para la funcionalidad de la barra de notificaciones
let variableBotonCerrarNotificacion = document.querySelector('.boton-cerrar-notificacion');
let variableCajaNotificacion = document.querySelector('.seccion-notificacion');


//procesamiento del icono de menu: aplica para la vista en dispositivos pequenos (responsive design)
variableBotonMenu.addEventListener('click', (event) => {

    //cambio al icono 'equis'
    variableIconoBarras.classList.toggle('fa-times');

    //header de las pantallas se muestra o se oculta cada vez que se presiona el icono
    if (booleanMenu) {
        variableMenuNav.style.left = '0%';
        variableMenuNav.style.transition = '0.3s';

        booleanMenu = false;
    }
    else {
        booleanMenu = false;
        variableMenuNav.style.left = '-100%';

        booleanMenu = true;
    }

});


//codigo del boton 'instrucciones': se muestra o se oculta la seccion
function metodoDesplegarInstrucciones() {

    if (variableBoolean) {

        variableInstruccionesParrafo.style.display = 'block';
        variableBoolean = false;

    } else {

        variableBoolean = false;
        variableInstruccionesParrafo.style.display = 'none';

        variableBoolean = true;

    }

};


//codigo para los procesos de la barra de notificaciones
variableBotonCerrarNotificacion.addEventListener('click', (event) => {

    variableCajaNotificacion.style.right = '-100%';
    variableCajaNotificacion.style.transition = '0.5s';

    

});

//metodo para aspecto y desplazamiento: notificacion de exito
function metodoMostrarNotificacionExito() {

    variableCajaNotificacion.className += ' seccion-notificacion-exito';

    variableCajaNotificacion.style.right = '3%';
    variableCajaNotificacion.style.transition = '0.5s';

};

//metodo para aspecto y desplazamiento: notificacion de error
function metodoMostrarNotificacionFallo() {

   
    variableCajaNotificacion.style.right = '3%';
    variableCajaNotificacion.style.transition = '0.5s';

};
