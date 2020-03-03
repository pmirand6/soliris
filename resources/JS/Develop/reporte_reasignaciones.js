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
            startView: 2,
            minViewMode: 0,
            multidate: 2,
            multidateSeparator: " / ",
            todayHighlight: true
        });
        $('#fecha').change(function () {
            $('.form').formValidation('revalidateField', 'fecha');
        });
        $("#DataReasig").dataTable({
                "bPaginate": true,
                "iDisplayLength": 15,
                "sPaginationType": "full_numbers",
                "bAutoWidth": true,
                "sDom": '<"top"B>rt<"bottom"ip><"clear">',
                "processing": true,
                "sAjaxSource": aplicacion + '/ajax/ajx.reporte_reasignaciones.php',
                // "deferRender": true,
                "aoColumns": [
                    { "mData": "Fecha", "bSearchable": true, "sWidth": "25%", "sClass": "center"},
                    { "mData": "Nota", "bSearchable": true, "sWidth": "75%", "sClass": "center"}
                ],
                "buttons": [
                    { extend: 'copyHtml5', text: '<i class="fa fa-files-o" aria-hidden="true"></i> Copiar'},
            { extend: 'print', text: '<i class="fa fa-print" aria-hidden="true"></i> Imprimir'},
            { extend: 'excel', text: '<i class="fa fa-file-excel-o" aria-hidden="true"></i> Excel'}
                ],
                "oLanguage": {
        				"sProcessing":     "Procesando...",
        				"sLengthMenu":     "Mostrar _MENU_ registros",
        				"sZeroRecords":    "No se encontraron resultados",
        				"sEmptyTable":     "Ningún dato disponible en esta tabla",
        				"sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
        				"sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
        				"sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
        				"sInfoPostFix":    "",
        				"sSearch":         "Buscar:",
        				"sUrl":            "",
        				"sInfoThousands":  ",",
        				"sLoadingRecords": "Cargando...",
        				"oPaginate": {
        					"sFirst":    "Primero",
        					"sLast":     "Último",
        					"sNext":     "Siguiente",
        					"sPrevious": "Anterior"
        				},
        				"oAria": {
        					"sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
        					"sSortDescending": ": Activar para ordenar la columna de manera descendente"
        				}
        			}
            })

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
                    fecha: {
                        message: 'La fecha no es válida',
                        validators: {
                              notEmpty: {
                                  message: 'El rango de fechas no puede quedar vacío'
                              },
                              callback: {
                                message: 'Fecha Inicio / Fecha Fin',
                                callback: function (value, validator, $field) {
                                    // Determine the numbers which are generated in captchaOperation
                                    if ($('#fecha').val().indexOf("/") > 0){
                                      var fechas = $('#fecha').val().split(' / ');
                                      var fecha1 = fechas[0].split('-');
                                      var fecha2 = fechas[1].split('-');

                                      var f1 = new Date(fecha1[0], fecha1[1], fecha1[2]);
                                      var f2 = new Date(fecha2[0], fecha2[1], fecha2[2]);
                                      if(f1 < f2){
                                        return true
                                      }else{
                                        return false
                                      }
                                    }else{
                                        return true
                                    }
                                }
                            }
                        }
                    }
                }})
            .on('success.form.fv', function(e) {
                // Prevent form submission
                e.preventDefault();

                var fecha;
                fecha = $('#fecha').val();
                reloadTBLinitial(fecha);
            })
        		.submit(function(e){
        			e.preventDefault();
        		});
    });
});
function reloadTBLinitial(init) {
    $('#loading').show(200);
    if (init != '') {
        $.get(aplicacion + '/ajax/ajx.reporte_reasignaciones.php?fecha=' + init, function (data) {
            doRefresh(data, "#DataReasig")
            $('#loading').hide(200);
        });
    }
}
function doRefresh(data, id) {
    // data is a string
    data = jQuery.parseJSON(data);

    $(id).dataTable().fnClearTable();
    if (data.aaData.length)
        $(id).dataTable().fnAddData(data.aaData);
    $(id).dataTable().fnDraw();

    $('#loading').hide(200);
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