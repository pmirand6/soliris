// eslint-disable-next-line no-use-before-define
var aplicacion = `${getCurrentHostname()}/${getUrlHTTP()}`
const ajaxUrl = `${aplicacion}/ajax/ajx.cliente.php`

function alertMessage(data) {
  // eslint-disable-next-line no-undef
  Swal.fire(data)
}

function getCurrentHostname() {
  var protocolo
  var url
  var vaPort
  var port

  protocolo = window.location.protocol
  url = window.location.hostname
  vaPort = window.location.port

  if (vaPort !== '') {
    port = `:${vaPort}`
  } else {
    port = ''
  }

  return `${protocolo}//${url}${port}`
}

function getUrlHTTP() {
  var path = window.location.pathname
  var appName = path.split('/')
  return appName[1]
}

/** Se genera un nuevo cliente */
function createCliente() {
  const parametros = $('.form').serializeArray()
  parametros.push({ name: 'oper', value: 'guarda' })

  $.post(
    ajaxUrl,
    parametros,
    function (data) {
      alertMessage(data)
    },
    'json'
  )

  $.ajax({
    url: `${aplicacion}/ajax/ajx.cliente.php`,
    type: 'POST',
    data: parametros,
    success(data) {
      alertMessage(data)
    },
  })
}

$.getScript(`${aplicacion}/resources/JS/funciones.min.js`, function () {
  // script is now loaded and executed.
  // put your dependent JS here.
  $(document).ready(function () {
    $('#selectClientes').select2({
      theme: 'bootstrap',
      placeholder: 'Seleccione un Cliente',
      minimumInputLength: 3,
      allowClear: true,
      language: 'es',
      ajax: {
        url: 'https://intranet.raffo:8080/api/list_clientes.asp',
        dataType: 'json',
        delay: 250,
        data: function (params) {
          return {
            q: params.term, // search term
            page: params.page,
          }
        },
        processResults: function (data) {
          return {
            results: data,
          }
        },
        cache: true,
      },
    })

    $('#selectClientes').on('select2:select', function (e) {
      // eslint-disable-next-line prefer-destructuring
      const data = e.params.data

      $('#zcust_addr').val(data.id)
      $('#zcust_city').val(data.zcust_city)
      $('#zcust_line1').val(data.zcust_line1)
    })

    // eslint-disable-next-line no-undef
    if (getQuerystring('id')) {
      $('.form').formValidation('removeField', 'selectClientes')
    }

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
          selectClientes: {
            validators: {
              notEmpty: {
                message: 'Debe Seleccionar un Cliente',
              },
            },
          },
          selConvenio: {
            validators: {
              notEmpty: {
                message: 'Debe seleccionar una opción',
              },
            },
          },
        },
      })
      .on('success.form.fv', function (e) {
        $('#bot_guardar').addClass('disabled')
        // Prevent form submission
        e.preventDefault()

        const parametros = {
          oper: 'Guardar',
          id: $('#id').val(),
          username: $('#nombreSelect').find(':selected').attr('data-username'),
          email: $('#nombreSelect').find(':selected').val(),
          nombreCompleto: $('#nombreSelect').find(':selected').text(),
          estado: $('#estado').val(),
        }

        createCliente(parametros)
      })
      .submit(function (e) {
        e.preventDefault()
      })
  })
})
