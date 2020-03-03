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
      title: "Editar Patología",
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

    $('#newPatologia').click(function () {
        $('#win').window('open');  // close a window
        $('#win_can').attr('src', aplicacion + '/administrador/patologia.php');
    });

    $('.panel-tool-close').click(function () {
        reloadTBLinitial();
    });
});

function reloadTBLinitial(){
    $('#DataPatologias').html('');
    $('#DataPatologias').load(aplicacion + '/ajax/ajx.patologias.php');
    $('#url').val('');
}
function callPatologia(id){
    $('#win').window('open');  // close a window
    $('#win_can').attr('src', aplicacion + '/administrador/patologia.php?id=' + id);
}
function delPatologia(id) {
    if (confirm('¿Desea desactivar esta patología?')) {
        var parametros = {
            "oper": "Eliminar",
            "id": id
        };
        $.ajax({
            url: aplicacion + '/ajax/ajx.patologia_form.php',
            type: "POST",
            data: parametros,
            success: function (opciones) {
                if (opciones.indexOf("ERROR")  != 0) {
                    alert('Se inactivó correctamente');
                    //window.location.href = window.location.href;
                    reloadTBLinitial();
                } else {
                    alert(opciones);
                }
            }
        });
    }
}

function actPatologia(id) {
    if (confirm('¿Desea Activar esta patología?')) {
        var parametros = {
            "oper": "Activar",
            "id": id
        };
        $.ajax({
            url: aplicacion + '/ajax/ajx.patologia_form.php',
            type: "POST",
            data: parametros,
            success: function (opciones) {
                if (opciones.indexOf("ERROR")  != 0) {
                    alert('Se activó la patología correctamente');
                    
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