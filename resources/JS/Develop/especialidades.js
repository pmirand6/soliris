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
      title: "Editar Especialidad",
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

    $('#newESP').click(function () {
        $('#win').window('open');  // close a window
        $('#win_dos').attr('src', aplicacion + '/administrador/a_esp.php');
    });

    $('.panel-tool-close').click(function () {
        reloadTBLinitial();
    });
});

function reloadTBLinitial(){
    $('#DataESP').html('');
    $('#DataESP').load(aplicacion + '/ajax/ajx.especialidades.php');
    $('#url').val('');
}
function callESP(id){
    $('#win').window('open');  // close a window
    $('#win_dos').attr('src', aplicacion + '/administrador/a_esp.php?id=' + id);
}
function delESP(id) {
    if (confirm('¿Desea Inactivar esta especialidad?')) {
        var parametros = {
            "oper": "Eliminar",
            "id": id
        };
        $.ajax({
            url: aplicacion + '/ajax/ajx.especialidad_form.php',
            type: "POST",
            data: parametros,
            success: function (opciones) {
                if (opciones.indexOf("ERROR")  != 0) {
                    alert('Se inactivó la especialidad seleccionada');
                    //window.location.href = window.location.href;
                    reloadTBLinitial();
                } else {
                    alert(opciones);
                }
            }
        });
    }
}

function actESP(id) {
    if (confirm('¿Desea Activar esta especialidad?')) {
        var parametros = {
            "oper": "Activar",
            "id": id
        };
        $.ajax({
            url: aplicacion + '/ajax/ajx.especialidad_form.php',
            type: "POST",
            data: parametros,
            success: function (opciones) {
                if (opciones.indexOf("ERROR")  != 0) {
                    alert('Se activó la especialidad');
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
