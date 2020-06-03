var aplicacion = `${getCurrentHostname()}/${getUrlHTTP()}`
$.getScript(`${aplicacion}/resources/JS/funciones.min.js`, function () {
  $(document).ready(function () {
    reloadTBLinitial()

    $('#win').window({
      modal: true,
      closed: true,
      minimizable: false,
      maximizable: false,
      title: 'Editar Canal',
      closeOnEscape: true,
      draggable: false,
      maximized: true,
      inline: true,
      collapsible: false,
      constrain: true,
      onBeforeClose() {
        window.location.href = window.location.href
      },
    })
    $('#newCanal').click(function () {
      $('#win').window('open') // close a window
      $('#win_can').attr('src', `${aplicacion}/administrador/canal.php`)
    })
    $('.panel-tool-close').click(function () {
      reloadTBLinitial()
    })
  })
})

function reloadTBLinitial() {
  $('#DataCanal').html('')
  $('#DataCanal').load(`${aplicacion}/vistas/canal/vista_canales.php`)
  $('#url').val('')
}
function callCanal(id) {
  $('#win').window('open') // close a window
  $('#win_can').attr('src', `${aplicacion}/administrador/canal.php?id=${id}`)
}
function ActivarCanales(id) {
  if (confirm('Desea activar a este Canal?')) {
    const parametros = {
      oper: 'Activar',
      id,
    }
    $.ajax({
      url: `${aplicacion}/ajax/ajx.canal_form.php`,
      type: 'POST',
      data: parametros,
      success(opciones) {
        if (opciones.indexOf('ERROR') != 0) {
          alert('Se cambio el estado correctamente')
          // window.location.href = window.location.href;
          reloadTBLinitial()
        } else {
          alert(opciones)
        }
      },
    })
  }
}

function delCanal(id) {
  if (confirm('Desea desactivar a este Canal?')) {
    const parametros = {
      oper: 'Eliminar',
      id,
    }
    $.ajax({
      url: `${aplicacion}/ajax/ajx.canal_form.php`,
      type: 'POST',
      data: parametros,
      success(opciones) {
        if (opciones.indexOf('ERROR') != 0) {
          alert('Se cambio el estado correctamente')
          // window.location.href = window.location.href;
          reloadTBLinitial()
        } else {
          alert(opciones)
        }
      },
    })
  }
}

function getCurrentHostname() {
  let protocolo
  let url
  let var_port
  let port

  protocolo = window.location.protocol
  url = window.location.hostname
  var_port = window.location.port

  if (var_port !== '') {
    port = `:${var_port}`
  } else {
    port = ''
  }

  return `${protocolo}//${url}${port}`
}

function getUrlHTTP() {
  const path = window.location.pathname
  const appName = path.split('/')
  return appName[1]
}
