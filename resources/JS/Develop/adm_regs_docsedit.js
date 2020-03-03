/**
 * Created by jgallina on 30/04/2015.
 */

var aplicacion = getCurrentHostname() + '/' + getUrlHTTP();
 $.getScript(aplicacion + '/resources/JS/funciones.min.js', function(){
    // script is now loaded and executed.
    // put your dependent JS here.
    $(document).ready(function() {
        var Receta = $("#Receta").uploadFile({
            url: aplicacion + '/resources/JQuery-FileUpload/PHP/upload_admregs.php',
            dragDrop: false,
            fileName: "myfile",
            autoSubmit: true,
            allowedTypes: "jpg,png,gif,doc,pdf,zip,bmp,tif",
            returnType: "json",
            dragDropStr: "<span><b>Arrastre y suelte el archivo...</b></span>",
            maxFileCount: 1,
            formData: {"idreg": $('#idreg').val(), "motivo": $('#motivo').val(),"numero":$("#numero").val()},
            onSuccess: function(files,data,xhr){
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
}