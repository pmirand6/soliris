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
      title: "Editar Dosis",
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

    $('#newDosis').click(function () {
        $('#win').window('open');  // close a window
        $('#win_dos').attr('src', aplicacion + '/administrador/a_dosis.php');
    });

    $('.panel-tool-close').click(function () {
        reloadTBLinitial();
    });
});

function reloadTBLinitial(){
    $('#DataDosis').html('');
    $('#DataDosis').load(aplicacion + '/ajax/ajx.dosis.php');
    $('#url').val('');
}
function callDosis(id){
    $('#win').window('open');  // close a window
    $('#win_dos').attr('src', aplicacion + '/administrador/a_dosis.php?id=' + id);
}
function delDosis(id) {
    if (confirm('¿Desea eliminar esta Dosis?')) {
        var parametros = {
            "oper": "Eliminar",
            "id": id
        };
        $.ajax({
            url: aplicacion + '/ajax/ajx.dosis_form.php',
            type: "POST",
            data: parametros,
            success: function (opciones) {
                if (opciones.indexOf("ERROR")  != 0) {
                    alert('Se eliminó la dosis seleccionada');
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
