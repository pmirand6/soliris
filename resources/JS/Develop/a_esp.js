/**
 * Created by jgallina on 30/04/2015.
 */
var aplicacion = getCurrentHostname() + '/' + getUrlHTTP()

$.getScript(aplicacion + '/resources/JS/funciones.min.js', function () {
  // script is now loaded and executed.
  // put your dependent JS here.
  $(document).ready(function () {
    $('.form')
      .formValidation({
        framework: 'bootstrap',
        excluded: ':disabled',
        icon: {
          valid: 'glyphicon glyphicon-ok',
          invalid: 'glyphicon glyphicon-remove',
          validating: 'glyphicon glyphicon-refresh',
        },
        fields: {
          nombre: {
            message: 'El nombre de la especialidad no es válido',
            validators: {
              notEmpty: {
                message: 'El nombre de la especialidad no puede quedar vacío',
              },
              stringLength: {
                min: 2,
                max: 45,
                message: 'El nombre de la especialidad debe contener como mínimo 2 y como máximo 45 letras',
              },
              regexp: {
                regexp: /^[a-zA-ZñÑáéíóúÁÉÍÓÚ\s]*$/,
                message: 'Este campo debe contener solo letras.',
              },
            },
          },
          familia: {
            message: 'La familia no es válida',
            validators: {
              stringLength: {
                min: 3,
                max: 3,
                message: 'El formato de la familia debe estar formado por 3 caracteres',
              },
            },
          },
        },
      })
      .on('success.form.fv', function (e) {
        // Prevent form submission
        e.preventDefault()

        var parametros = {
          oper: 'Guardar',
          id: $('#id').val(),
          nombre: $('#nombre').val(),
          familia: $('#familia').val(),
          estado: $('#estado').val(),
        }
        $.ajax({
          url: aplicacion + '/ajax/ajx.especialidad_form.php',
          type: 'POST',
          data: parametros,
          success: function (opciones) {
            if (opciones.indexOf('ERROR') != 0) {
              alert('Se registró correctamente, ya puede cerrar esta ventana')
              parent.location.reload()
            } else {
              alert(opciones)
            }
          },
        })
      })
      .submit(function (e) {
        e.preventDefault()
      })
  })
})

function getCurrentHostname() {
  var protocolo, url, var_port, port

  protocolo = window.location.protocol
  url = window.location.hostname
  var_port = window.location.port

  if (var_port !== '') {
    port = ':' + var_port
  } else {
    port = ''
  }

  return protocolo + '//' + url + port
}

function getUrlHTTP() {
  var path = window.location.pathname
  var appName = path.split('/')
  return appName[1]
}
