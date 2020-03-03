var aplicacion = getCurrentHostname() + '/' + getUrlHTTP();
$(document).ready(function() {
    $('#loading').hide();

    $('.iniciales').click(function () {
        var initial = $(this).attr('id');
        $('#loading').show(200);

        $('#tablas').html('');
        $('#tablas').load(aplicacion + '/ajax/ajx.reporte_grilla.php?oper=CAN&ao=' + initial, function() {
            $('#loading').hide(200);
        });
    });
});

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