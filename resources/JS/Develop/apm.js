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

        $('#nombre').keyup(function(){
            var searchField = $('#nombre').val();
            var regex = new RegExp(searchField, "i");
            var output = '<ul class="list-group">';
            var count = 1;
            var url_json = "https://192.168.0.106/u_ad_js/";
            if (searchField != null && searchField.length >= minlength) {
                $.getJSON(url_json, function(data) {
                  $.each(data, function(key, val){
                    if ((val.CN.search(regex) != -1)) {
                      output += '<li class="list-group-item link-class">'
                      output += '<span class="text-muted" id="span_user">'+val.CN
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
             nombre: {
                message: 'El nombre del APM no es válido',
                validators: {
                   notEmpty: {
                      message: 'El nombre del APM no puede quedar vacío'
                  },
                  regexp: {
                      regexp: /^[a-zA-ZñÑáéíóúÁÉÍÓÚ\s'´,]*$/,
                      message: 'Este campo debe contener solo letras.'
                  },
                  callback: {
                            message: 'El APM no existe en el Dominio',
                            callback: function (value, validator, $field) {
                                if (usuario_ok == 1) {
                                    return true;
                                } else {
                                    return false;
                                }

                            }
                        },
                  stringLength: {
                      min: 2,
                      max: 45,
                      message: 'El nombre del APM debe contener como mínimo 2 y como máximo 45 letras'
                  },
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
        .on('success.form.fv', function(e) {
          $("#bot_guardar").addClass('disabled');
				// Prevent form submission
				e.preventDefault();

				var parametros = {
					"oper": "Guardar",
					"id": $('#id').val(),
					"nombre": $('#nombre').val(),
					"estado": $('#estado').val()
				};
				$.ajax({
					url: aplicacion + '/ajax/ajx.apm_form.php',
					type: "POST",
					data: parametros,
					success: function (opciones) {
						if (opciones.indexOf("ERROR")  != 0) {
							alert('Se registró correctamente, ya puede cerrar esta ventana');
                            window.top.location.reload();
                        }else{
                         alert(opciones);
                     }
                 }
             });
			})
        .submit(function(e){
          e.preventDefault();
      });
    });
});

$(document).on('click', '#span_user', function(){
    $('#nombre').val($(this).text());
    if ($('#nombre').val() == $(this).text()) {
      usuario_ok = 1;
      $('.form').formValidation('revalidateField', 'nombre');
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