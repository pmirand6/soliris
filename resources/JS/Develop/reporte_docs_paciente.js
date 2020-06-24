var aplicacion = getCurrentHostname() + '/' + getUrlHTTP();
$.getScript(aplicacion + '/resources/JS/funciones.min.js', function(){
    // script is now loaded and executed.
    // put your dependent JS here.
    $(document).ready(function() {
    const currentTime = new Date()

        $('#loading').hide();
        $('.date').datepicker({
            format: "yyyy",
            language: "es",
            endDate: currentTime.getFullYear() + '-01-31',
            calendarWeeks: true,
            autoclose: true,
            clearBtn: true,
            startView: 2,
            minViewMode: 2,
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

        $("#DataRVP").dataTable({
            "bPaginate": true,
            "iDisplayLength": 10,
            "sPaginationType": "full_numbers",
            "bAutoWidth": true,
            "sDom": '<"top"B>frt<"bottom"ip><"clear">',
            "processing": true,
            "sAjaxSource": aplicacion + '/ajax/ajx.reporte_docs_paciente.php',
            // "deferRender": true,
            "aoColumns": [
                { "mData": "ID", "bSearchable": true, "bVisible": false, "sClass": "center"},
                { "mData": "Nombre", "bSearchable": true, "sWidth": "20%", "sClass": "center"},
                { "mData": "CANT", "bSearchable": true, "sWidth": "10%", "sClass": "center"},
                { "mData": "U_Venta", "bSearchable": true, "sWidth": "10%", "sClass": "center"},
                { "mData": "Tarjeta", "bSearchable": true, "sWidth": "10%", "sClass": "center"},
                { "mData": "Consentimiento", "bSearchable": true, "sWidth": "20%", "sClass": "center"}
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
				},
                buttons: {
                    copyTitle: 'Copiado al Portapapeles',
                    copyKeys: 'Presione <i>CRTL</i> ó <i>\u2318</i> + <i>C</i> para copiar la tabla en el documento que desee. <br><br>Para cancelar, haga click sobre este mensaje o presione la tecla ESC.',
                    copySuccess: {
                        _: '%d líneas copiadas',
                        1: '1 línea copiada'
                    }
				}            
            }
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
                            lessThan: {
                                value: 'aoFin',
                                message: 'La fecha inicial no puede ser superior a la fecha final',
                            }
                        }
                    },
                    aoFin: {
                        message: 'La fecha final no es válida',
                        validators: {
                            notEmpty: {
                                message: 'La fecha final no puede quedar vacía'
                            },
                            greaterThan: {
                                value: 'aoIni',
                                message: 'La fecha final no puede ser inferior a la fecha inicial'
                            }
                        }
                    }
                }})
            .on('success.form.fv', function(e) {
                // Prevent form submission
                e.preventDefault();
                var init, fin;
                init = $('#aoIni').val();
                fin = $('#aoFin').val();

                reloadTBLinitial(init, fin);
            })
    		.submit(function(e) {
    			e.preventDefault();
    		});
    });
});

    function reloadTBLinitial(init, fin) {
        $('#loading').show(200);

        if (init != '' && fin != '') {
            $.get(aplicacion + '/ajax/ajx.reporte_docs_paciente.php?ini=' + init + '&fin=' + fin, function (data) { doRefresh(data, "#DataRVP") });
        } else {
            $.get(aplicacion + '/ajax/ajx.reporte_docs_paciente.php', function (data) { doRefresh(data, "#DataRVP") });
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
    function getData(idDest, aRow, id, nroCol) {
        if ($(id).dataTable().fnGetData(aRow) != '' || nroCol != '') {
            $('#' + idDest).val($(id).dataTable().fnGetData(aRow)[nroCol]);
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