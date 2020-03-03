/**
 * Created by jgallina on 20/04/2015.
 */
var aplicacion = getCurrentHostname() + '/' + getUrlHTTP();
$.getScript(aplicacion + '/resources/JS/funciones.min.js', function(){
    // script is now loaded and executed.
    // put your dependent JS here.
    $(document).ready(function(){
        //$("#save").attr("disabled", true);
        $('.date').datepicker({
            format: "yyyy-mm-dd",
            language: "es",
            endDate: getDate(),
            calendarWeeks: true,
            autoclose: true,
            clearBtn: true,
            todayHighlight: true
        });

        $('#fecha_cap').change(function () {
            if($('#fecha_cap').val() !== ''){
                $("#doc_cap").show(200);
            }else{
                $("#doc_cap").hide(200);
            }

        });

        var Capacitacion = $("#Capacitacion").uploadFile({
            url: aplicacion + '/resources/JQuery-FileUpload/PHP/upload.php',
            dragDrop: false,
            fileName: "myfile",
            autoSubmit: false,
            allowedTypes: "jpg,png,gif,doc,pdf,zip,bmp,tif",
            returnType: "json",
            dragDropStr: "<span><b>Arrastre y suelte el archivo...</b></span>",
            maxFileCount: 1,
            formData: {"id": $('#id').val(), "referencia": "medicos", "fecha": $("#fecha").val(), "tipo": 'Capacitacion'},
            onSuccess: function(files,data,xhr){
                //$("#save").attr("disabled", false);
                var parametros = {
                    "oper": "reCap",
                    "id" : $("#id").val(),
                    "fecha_cap" : $("#fecha").val()
                };
                $.ajax({
                    url: aplicacion + '/ajax/ajx.medico_capDate.php',
                    type: "POST",
                    data: parametros,
                });
            },
            
        });

        $('#back').click(function () {
            if (getQuerystring("id") !== '') {
                var $btn = $(this).button('loading');
                window.location.href = aplicacion + '/administrador/medico.php?id=' + getQuerystring("id");
                $btn.button('reset');
            }
        });
        $('#save').click(function () {
            var $btn = $(this).button('loading');
            Capacitacion.startUpload();
            $btn.button('reset');
			wait(3000);
			alert('Se registró correctamente, ya puede cerrar esta ventana');
			window.location.href = aplicacion + '/administrador/medicos.php';
			
        });
        $('#Docs').click(function () {
            if (getQuerystring("id") !== ''){
                var $btn = $(this).button('loading');
                window.location.href = aplicacion + '/administrador/medico.php?id=' + getQuerystring("id");
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