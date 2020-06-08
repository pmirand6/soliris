var aplicacion = `${getCurrentHostname()}/${getUrlHTTP()}`
$.getScript(`${aplicacion}/resources/JS/funciones.min.js`, function () {
  // script is now loaded and executed.
  // put your dependent JS here.
  $(document).ready(function () {
    $('#select-clientes').select2({
      theme: 'bootstrap',
      placeholder: 'Seleccione un APM',
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
          console.log(data)
          return {
            results: data,
          }
        },
        cache: true,
      },
      // templateResult: formatRepo,
      templateSelection(data, container) {
        console.log(data.element)
        /* $(data.element).attr('data-username', data.username)
        return data.text */
      },
    })
  })
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
