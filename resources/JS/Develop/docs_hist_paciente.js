var aplicacion = getCurrentHostname() + '/' + getUrlHTTP();
$.getScript(aplicacion + '/resources/JS/funciones.min.js', function(){
    // script is now loaded and executed.
    // put your dependent JS here.
    $(document).ready(function(){
        $('#Docs').click(function () {
            if (getQuerystring("id") != '') {
                var $btn = $(this).button('loading')
                window.location.href = aplicacion + '/administrador/paciente.php?id=' + getQuerystring("id");
                $btn.button('reset');
            }
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
}aplicacion