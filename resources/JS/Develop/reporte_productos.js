var aplicacion = getCurrentHostname() + '/' + getUrlHTTP();
$.getScript(aplicacion + '/resources/JS/funciones.min.js', function(){
    // script is now loaded and executed.
    // put your dependent JS here.
    $(document).ready(function() {
        $('#loading').hide();

        $('.date').datepicker({
            format: "yyyy-mm-dd",
            language: "es",
            endDate: getDate(),
            calendarWeeks: true,
            autoclose: true,
            clearBtn: true,
            todayHighlight: true
        });

        $('#aoIni').change(function () {
            $('.form').formValidation('revalidateField', 'aoIni');
            $('.form').formValidation('revalidateField', 'aoFin');
        });
        $('#aoFin').change(function () {
            $('.form').formValidation('revalidateField', 'aoIni');
            $('.form').formValidation('revalidateField', 'aoFin');
        });

        $('.form')
            .formValidation({
                framework: 'bootstrap',
                excluded: ':disabled',
                icon: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    aoIni: {
                        message: 'La fecha inicial no es válida',
                        validators: {
                            notEmpty: {
                                message: 'La fecha inicial no puede quedar vacía'
                            },
                            date: {
                                message: 'La fecha inicial no puede ser superior a la fecha final',
                                format: 'YYYY-MM-DD',
                                max: 'aoFin'
                            }
                        }
                    },
                    aoFin: {
                        message: 'La fecha final no es válida',
                        validators: {
                            notEmpty: {
                                message: 'La fecha final no puede quedar vacía'
                            },
                            date: {
                                message: 'La fecha final no puede ser inferior a la fecha inicial',
                                format: 'YYYY-MM-DD',
                                min: 'aoIni'
                            }
                        }
                    }
                }})
            .on('success.form.fv', function(e) {
                // Prevent form submission
                e.preventDefault();

                $('#loading').show(200);

                var ini, fin;
                ini = $("#aoIni").val();
                fin = $("#aoFin").val();

                $("#rep").attr('src', aplicacion + '/ajax/ajx.reporte_productos.php?ini=' + ini + '&fin=' + fin);
                $('#loading').hide(300);
            })
            .submit(function(e){
                e.preventDefault();
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