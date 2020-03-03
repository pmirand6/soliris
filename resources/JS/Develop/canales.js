/**
 * Created by jgallina on 06/05/2015.
 */
var aplicacion = getCurrentHostname() + '/' + getUrlHTTP();
 $.getScript(aplicacion + '/resources/JS/funciones.min.js', function(){
    // script is now loaded and executed.
    // put your dependent JS here.
    $(document).ready(function() {
        reloadTBLinitial()

        $("#win").window({
          modal: true,
          closed: true,
          minimizable: false,
          maximizable: false,
          title: "Editar Canal",
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
        $('#newCanal').click(function () {
            $('#win').window('open');  // close a window
            $('#win_can').attr('src', aplicacion + '/administrador/canal.php');
        });
        $('.panel-tool-close').click(function () {
            reloadTBLinitial();
        });
    });
});    

function reloadTBLinitial(){
    $('#DataCanal').html('');
    $('#DataCanal').load(aplicacion + '/ajax/ajx.canales.php');
    $('#url').val('');
}
function callCanal(id){
    $('#win').window('open');  // close a window
    $('#win_can').attr('src', aplicacion + '/administrador/canal.php?id=' + id);
}
function ActivarCanales(id){
    if (confirm('Desea activar a este Canal?')) {
        var parametros = {
            "oper": "Activar",
            "id": id
        };
        $.ajax({
            url: aplicacion + '/ajax/ajx.canal_form.php',
            type: "POST",
            data: parametros,
            success: function (opciones) {
                if (opciones.indexOf("ERROR")  != 0) {
                    alert('Se cambio el estado correctamente');
                    //window.location.href = window.location.href;
                    reloadTBLinitial();
                } else {
                    alert(opciones);
                }
            }
        });
    }
}


function delCanal(id){
    if (confirm('Desea desactivar a este Canal?')) {
        var parametros = {
            "oper": "Eliminar",
            "id": id
        };
        $.ajax({
            url: aplicacion + '/ajax/ajx.canal_form.php',
            type: "POST",
            data: parametros,
            success: function (opciones) {
                if (opciones.indexOf("ERROR")  != 0) {
                    alert('Se cambio el estado correctamente');
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