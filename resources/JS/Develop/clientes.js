/**
 * Created by jgallina on 06/05/2015.
 */
var aplicacion = `${getCurrentHostname()}/${getUrlHTTP()}`
$.getScript(`${aplicacion}/resources/JS/funciones.min.js`, function () {
  // script is now loaded and executed.
  // put your dependent JS here.
  $(document).ready(function () {
    reloadTBLinitial()

    $('#win').window({
      modal: true,
      closed: true,
      minimizable: false,
      maximizable: false,
      title: 'Editar Cliente',
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
    $('#newCliente').click(function () {
      $('#win').window('open') // close a window
      $('#win_can').attr('src', `${aplicacion}/administrador/cliente.php`)
    })
    $('.panel-tool-close').click(function () {
      reloadTBLinitial()
    })
  })
})

function reloadTBLinitial() {
  $('#DataCanal').html('')
  $('#DataCanal').load(`${aplicacion}/vistas/cliente/vista_cliente.php`)
  $('#url').val('')
}
function callCliente(id) {
  $('#win').window('open') // close a window
  $('#win_can').attr('src', `${aplicacion}/administrador/cliente.php?id=${id}`)
}
function ActivarCliente(id) {
  if (confirm('Desea activar a este Canal?')) {
    let parametros = {
      oper: 'Activar',
      id,
    }
    $.ajax({
      url: `${aplicacion}/ajax/ajx.cliente.php`,
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

function delCliente(id) {
  if (confirm('Desea desactivar a este Cliente?')) {
    var parametros = {
      oper: 'Eliminar',
      id,
    }
    $.ajax({
      url: `${aplicacion}/ajax/ajx.cliente.php`,
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
  var protocolo
  var url
  var var_port
  var port

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
  var path = window.location.pathname
  var appName = path.split('/')
  return appName[1]
}
