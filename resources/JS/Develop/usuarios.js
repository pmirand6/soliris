/**
 * Created by jgallina on 06/05/2015.
 */
var aplicacion = getCurrentHostname() + '/' + getUrlHTTP();
$(document).ready(function() {
    reloadTBLinitial('')

    $("#win").window({
      modal: true,
      closed: true,
      minimizable: false,
      maximizable: false,
      title: "Editar Usuario",
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

    $('#newUsr').click(function () {
        $('#win').window('open');  // close a window
        $('#win_Usr').attr('src', aplicacion + '/administrador/usuario.php');
    });

    $('.panel-tool-close').click(function () {
        reloadTBLinitial($('#url').val());
    });
});
function reloadTBLinitial(){
        $('#DataUsr').html('');
        $('#DataUsr').load(aplicacion + '/ajax/ajx.usuarios.php');
        $('#url').val('');
}
function callUsr(id){
    $('#win').window('open');  // close a window
    $('#win_Usr').attr('src', aplicacion + '/administrador/usuario.php?id=' + id);
}
function delUsr(id) {
    if (confirm('¿Desea desactivar este usuario?')){
        var parametros = {
            "oper": "Eliminar",
            "id": id
        };
        $.ajax({
            url: aplicacion + '/ajax/ajx.usuario_form.php',
            type: "POST",
            data: parametros,
            success: function (opciones) {
                if (opciones.indexOf("ERROR")  != 0) {
                    alert('Se inactivó correctamente, ya puede cerrar esta ventana');
                    //window.location.href = window.location.href;
                    reloadTBLinitial()
                }else{
                    alert(opciones);
                }
            }
        });
    }
}

function actUsr(id) {
    if (confirm('¿Desea Activar este usuario?')){
        var parametros = {
            "oper": "Activar",
            "id": id
        };
        $.ajax({
            url: aplicacion + '/ajax/ajx.usuario_form.php',
            type: "POST",
            data: parametros,
            success: function (opciones) {
                if (opciones.indexOf("ERROR")  != 0) {
                    alert('Se el activó usuario correctamente, ya puede cerrar esta ventana');
                    //window.location.href = window.location.href;
                    reloadTBLinitial()
                }else{
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