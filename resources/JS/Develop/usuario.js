/**
 * Created by jgallina on 30/04/2015.
 */
 var usuario_ok = 0;
var aplicacion = getCurrentHostname() + '/' + getUrlHTTP();
 $.getScript(aplicacion + '/resources/JS/funciones.min.js', function(){
    // script is now loaded and executed.
    // put your dependent JS here.
    $(document).ready(function() {
        var minlength = 3;
        var searchField = null;
        
        $('#usuario').keyup(function(){
            var searchField = $('#usuario').val();
            var regex = new RegExp(searchField, "i");
            //var output = '<div class="row">';
            var output = '<ul class="list-group">';
            var count = 1;
            //FIXME ver de traer de AD los usuarios
            var url_json = "https://192.168.0.106/u_ad_js/";
            if (searchField != null && searchField.length >= minlength) {
                $.getJSON(url_json, function(data) {
                  $.each(data, function(key, val){
                    if ((val.SamAccountName.search(regex) != -1) || (val.CN.search(regex) != -1)) {
                      output += '<li class="list-group-item link-class">'
                      output += '<span class="text-muted" id="span_user" data="'+val.mail+'" u="'+val.SamAccountName+'">'+ val.CN + ' (' + '<b>' + val.SamAccountName + '</b>' + ')'
                      if(count%2 == 0){
                        output += '</span></li>'
                    }
                    count++;
                }
            });
                  //output += '</div>';
                  output += '</ul>';
                  $('#result_usuarios').html(output);
              });
            } else {
                $('#result_usuarios').html('');
                
            }


        });

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
                usuario: {
                    message: 'El usuario no es válido',
                    validators: {
                        notEmpty: {
                            message: 'El usuario no puede quedar vacío'
                        },
                        callback: {
                            message: 'El usuario no existe en el Dominio',
                            callback: function (value, validator, $field) {
                                
                                if (usuario_ok == 1) {
                                    return true;
                                } else {
                                    return false;
                                }

                            }
                        },
                        regexp: {
                          regexp: /^[a-zA-ZñÑáéíóúÁÉÍÓÚ\s'´,]*$/,
                          message: 'Este campo debe contener solo letras.'
                      },
                  }
              },
              grupo: {
                validators: {
                    notEmpty: {
                        message: 'El grupo del usuario no puede quedar vacío'
                    }
                }
            },
            mail: {
                validators: {
                    emailAddress: {
                        message: 'Por favor, ingrese una dirección de e-mail o deje vacío el campo'
                    },
                    regexp: {
                                regexp: /^\S+@\S+\.\S+$/, //Validación para doble dominio
                                message: 'El formato del e-mail no es válido'
                            },
                            stringLength: {
                                min: 4,
                                max: 90,
                                message: 'El e-mail debe contener como mínimo 4 y como máximo 90 caracteres'
                            },
                            notEmpty: {
                                message: 'El email del usuario no puede quedar vacío'
                            }
                        }
                    },
                    estado: {
                        validators: {
                            notEmpty: {
                                message: 'El Estado del usuario no puede quedar vacío'
                            }
                        }
                    },
                    familia: {
                        message: 'La familia no es válida',
                        validators: {
                            stringLength: {
                                min: 3,
                                max: 3,
                                message: 'El formato de la familia debe estar formado por 3 caracteres'
                            }
                        }
                    }
                }
            })
        .on('success.form.fv', function(e) {
                // Prevent form submission
                e.preventDefault();

                var parametros = {
                    "oper": "Guardar",
                    "id": $('#id').val(),
                    "usuario": $('#usuario').val(),
                    "grupo": $('#grupo').val(),
                    "mail": $('#mail').val(),
                    "estado": $('#estado').val(),
                    "familia": $('#familia').val()
                };
                $.ajax({
                    url: aplicacion + '/ajax/ajx.usuario_form.php',
                    type: "POST",
                    data: parametros,
                    success: function (opciones) {
                        if (opciones.indexOf("ERROR")  != 0) {
                            alert('Se registró correctamente, ya puede cerrar esta ventana');
                            window.location.href = aplicacion + '/administrador/usuarios.php?id=' + getQuerystring("id");
                        }else{
                            alert(opciones);
                        }
                    }
                });
            })
        .submit(function(e){
         e.preventDefault();
     });

        $('#estado').change(function () {
            if($("#estado").val() != ''){
                $('#icon_estado').removeClass();
                $('#icon_estado').addClass('TBL TBL-' + $("#estado").val().replace(" ", "_"));
            }else{
                $('#icon_estado').removeClass();
                $('#icon_estado').addClass('fa fa-check-circle-o');
            }
        });
    });
});

$(document).on('click', '#span_user', function(){
    var mail_user = $(this).attr("data").toLowerCase();
    var n_usuario = $(this).attr("u").toLowerCase();
    $('#usuario').val(n_usuario);
    $('#mail').val(mail_user);
    if ($('#usuario').val() == n_usuario && $('#mail').val() != "") {
        var mail_check = mail_user.substr(0, mail_user.indexOf('@'));
        
        if (n_usuario === mail_check) {
        
            usuario_ok = 1;
            $('.form').formValidation('revalidateField', 'usuario');
            $('.form').formValidation('revalidateField', 'mail');
        } else {
            usuario_ok = 0;
            $('.form').formValidation('revalidateField', 'usuario');
        }
        
    }
    $("#result_usuarios").html('');

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
