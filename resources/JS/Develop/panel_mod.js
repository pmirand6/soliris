/**
 * Created by jgallina on 30/04/2015.
 */
var aplicacion = getCurrentHostname() + '/' + getUrlHTTP();
$.getScript(aplicacion + '/resources/JS/funciones.min.js', function(){
    // script is now loaded and executed.
    // put your dependent JS here.
    $(document).ready(function() {
        $('.form')
            .formValidation({
                framework: 'bootstrap',
                excluded: ':disabled',
                icon: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    comentario: {
                        validators: {
                            stringLength: {
                                min: 4,
                                message: 'El comentario debe contener como mínimo 4 caracteres'
                            }
                        }
                    },
                    estado: {
                        validators: {
                            notEmpty: {
                                message: 'El estado no puede quedar vacío'
                            }
                        }
                    }
                }
            })
            .submit(function(e){
                e.preventDefault();
            });

        $('#confirmar_venta').click(function () {
            var form = $('.form').data('formValidation').validate();
            if (form.isValid()){
                // ACC = NU
                var parametros = {
                    "oper": "nu",
                    "id": $('#id').val(),
                    "paciente": $('#paciente').val(),
                    "comentario": $('#comentario').val(),
                    "estado": $('#estado').val()
                };
                $.ajax({
                    url: aplicacion + '/ajax/ajx.panel_mod_form.php',
                    type: "POST",
                    data: parametros,
                    success: function (opciones) {
                        if (opciones.indexOf("ERROR")  != 0) {
							id=opciones.replace("OK","");
                            alert('Se realizo la actualización del registro bajo el numero: ' + id);
                            $('.boton').fadeOut(500);
							window.location.href = aplicacion + '/main/panel.php' ;
                        } else {
                            alert(opciones);
                        }
                    }
                });
            }
        });
        $('#bot_guardar').click(function () {
            var form = $('.form').data('formValidation').validate();
            if (form.isValid()){
                // ACC = UP
                var parametros = {
                    "oper": "up",
                    "paciente": $('#paciente').val(),
                    "id": $('#id').val()
                };
                $.ajax({
                    url: aplicacion + '/ajax/ajx.panel_mod_form.php',
                    type: "POST",
                    data: parametros,
                    success: function (opciones) {
						id=opciones.replace("OK","");
                        if (opciones.indexOf("ERROR")  != 0) {
                            alert('Se realizo la actualización del registro bajo el numero: ' + opciones);
                            $('.boton').fadeOut(500);
							window.location.href = aplicacion + '/main/panel.php' ;
                        }else{
                            alert(opciones);
                        }
                    }
                });
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