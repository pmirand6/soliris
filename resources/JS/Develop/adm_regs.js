/**
 * Created by jgallina on 30/04/2015.
 */
var aplicacion = getCurrentHostname() + '/' + getUrlHTTP();
 $.getScript(aplicacion + '/resources/JS/funciones.min.js', function(){
    // script is now loaded and executed.
    // put your dependent JS here.
    $(document).ready(function () {
        $('#form_reg')
        .formValidation({
         framework: 'bootstrap',
         excluded: ':disabled',
         icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            accion: {
               message: 'Seleccione una acción valida',
               validators: {
                  notEmpty: {
                     message: 'Seleccione una acción valida'
                 }
             }
         },
         idreg: {
           message: 'Escriba un número de registro valido',
           validators: {
              digits: {
                 message: 'El número de registro solo puede estar formado por digitos'
             },
             notEmpty: {
                 message: 'El número de registro no puede quedar vacío'
             }
         }
     },
     motivo: {
       message: 'Escriba un motivo valido',
       validators: {
          stringLength: {
             min: 4,
             message: 'El motivo debe tener como mínimo 4 caracteres'
         },
         regexp: {
            regexp: /^[0-9a-zA-ZñÑáéíóúÁÉÍÓÚ\s'´.]+$/,
            message: 'Este campo debe contener solo letras y/o números.'
        }
    }
}
}
})
        .on('success.form.fv', function(e) {
                // Prevent form submission
                e.preventDefault();

                if ($('#accion').val() == 'registro'){
                  $('#registro').html('');
                  $('#registro').load(aplicacion + '/administrador/adm_regs_edit.php?idreg=' + $("#idreg").val() + '&motivo=' + encodeURI($("#motivo").val()));
              }else{
                  $('#registro').html('');
                  $('#registro').load(aplicacion + '/administrador/adm_regs_docsedit.php?idreg=' + $("#idreg").val() + '&motivo=' + encodeURI($("#motivo").val()));
              }
          })
        .submit(function(e){
         e.preventDefault();
     })
        .keypress(function(e) {
            if (e.which == 13) {
                return false;
            }
        });
    });
});

 function getCurrentHostname(){
    var protocolo, url, var_port, port;

    protocolo = window.location.protocol;
    url = window.location.hostname;
    var_port = window.location.port;

    if (var_port !== '') {
        port = ':' + var_port;
    } else {
        port = '';
    }

    return protocolo + '//' + url + port;
}


function getUrlHTTP() {

    var path = window.location.pathname;
    var appName = path.split("/");
    return appName[1];
}