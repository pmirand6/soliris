/**
 * Created by jgallina on 06/05/2015.
 */
var aplicacion = getCurrentHostname() + '/' + getUrlHTTP();
$(document).ready(function() {
    reloadTBLinitial()

    $("#win").window({
      modal: true,
      closed: true,
      minimizable: false,
      maximizable: false,
      title: "Editar Unidades",
      closeOnEscape: true,
      draggable: false,
      maximized: true,
      inline: true,
      collapsible: false,
      constrain: true,
      onBeforeClose: function() {
        window.location.href = window.location.href;
      }
    });

    $('#newUnidades').click(function () {
        $('#win').window('open');  // close a window
        $('#win_dos').attr('src', aplicacion + '/administrador/a_unidad.php');
    });

    $('.panel-tool-close').click(function () {
        reloadTBLinitial();
    });
});

function reloadTBLinitial(){
    $('#DataUnidades').html('');
    $('#DataUnidades').load(aplicacion + '/ajax/ajx.unidades.php');
    $('#url').val('');
}
function callUnidades(id){
    $('#win').window('open');  // close a window
    $('#win_dos').attr('src', aplicacion + '/administrador/a_unidad.php?id=' + id);
}
function delUnidad(id) {
    if (confirm('Desea Eliminar esta Unidad?')) {
        var parametros = {
            "oper": "Eliminar",
            "id": id
        };
        $.ajax({
            url: aplicacion + '/ajax/ajx.unidades_form.php',
            type: "POST",
            data: parametros,
            success: function (opciones) {
                if (opciones.indexOf("ERROR")  != 0) {
                    alert('Se eliminó la unidad seleccionada');
                    //window.location.href = window.location.href;
                    reloadTBLinitial();
                } else {
                    alert(opciones);
                }
            }
        });
    }
}

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
