/**
 * Created by jgallina on 20/04/2015.
 */
var aplicacion = getCurrentHostname() + '/' + getUrlHTTP();
 $.getScript(aplicacion + '/resources/JS/funciones.min.js', function(){
    // script is now loaded and executed.
    // put your dependent JS here.
    $(document).ready(function(){

        var Canal = $("#file_canal").uploadFile({
            url: aplicacion + '/resources/JQuery-FileUpload/PHP/upload.php',
            autoSubmit:false,
            dragDrop: false,
            fileName: "myfile",
            allowedTypes: "jpg,png,gif,doc,pdf,zip,bmp,tif",
            returnType: "json",
            dragDropStr: "<span><b>Arrastre y suelte el archivo...</b></span>",
            maxFileCount: 1,
            multiple:false,
            formData: {"id": $('#id').val(), "referencia": "canales", "tipo": 'Canal'},
            onSuccess: function(files,data,xhr){
                //alert((data));
                $("#file_canal").addClass("glyphicon glyphicon-ok");
            }
        });

        $('#save').click(function () {
            var $btn = $(this).button('loading')

            Canal.startUpload();
			wait(3000);
			alert('Se registró correctamente.');
			window.location.href = aplicacion + '/administrador/canales.php';
            $btn.button('reset');
        });
        $('#Docs').click(function () {
            if (getQuerystring("id") != ''){
                var $btn = $(this).button('loading')
                window.location.href = aplicacion + '/administrador/canal.php?id=' + getQuerystring("id");
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
}