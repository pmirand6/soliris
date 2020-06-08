var aplicacion = `${getCurrentHostname()}/${getUrlHTTP()}`
$.getScript(`${aplicacion}/resources/JS/funciones.min.js`, function () {
  // script is now loaded and executed.
  // put your dependent JS here.
  $(document).ready(function () {
    $('#select-clientes').select2({
      theme: 'bootstrap',
      placeholder: 'Seleccione un Cliente',
      minimumInputLength: 3,
      allowClear: true,
      language: 'es',
      ajax: {
        url: 'https://intranet.raffo:8080/api/list_clientes.asp',
        dataType: 'json',
        delay: 250,
        data(params) {
          return {
            q: params.term, // search term
            page: params.page,
          }
        },
        processResults(data) {
          return {
            results: data,
          }
        },
        cache: true,
      },
    })
  })
})

$('#select-clientes').on('select2:select', function (e) {
  let data = e.params.data
  console.log(data)
  $('#zcust_addr').val(data.id)
  $('#zcust_city').val(data.zcust_city)
  $('#zcust_line1').val(data.zcust_line1)
})

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
