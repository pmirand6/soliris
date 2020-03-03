var aplicacion = getCurrentHostname() + '/' + getUrlHTTP();
$.getScript(aplicacion + '/resources/JS/funciones.min.js', function(){
    // script is now loaded and executed.
    // put your dependent JS here.
    $(document).ready(function() {
        $('#loading').hide();
        $('#limpiar').hide();

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

        $("#DataRV").dataTable( {
            "bPaginate": true,
            "iDisplayLength": 10,
            "sPaginationType": "full_numbers",
            "bAutoWidth": true,
            "sDom": '<"top"B>frt<"bottom"ip><"clear">',
            "processing": true,
            "sAjaxSource": aplicacion + '/ajax/ajx.reporte_ventas.php',
            "aoColumns": [
                { "mData": "cargado", "bSearchable": true, "sWidth": "40%","sClass": "center"},
                { "mData": "dosis1", "bSearchable": true, "sWidth": "15%", "sClass": "center"},
                { "mData": "dosis2", "bSearchable": true, "sWidth": "15%", "sClass": "center"},
                { "mData": "dosis3", "bSearchable": true, "sWidth": "15%", "sClass": "center"},
                { "mData": "dosis4", "bSearchable": true, "sWidth": "15%", "sClass": "center"}
            ],
            "buttons": [
                { extend: 'copyHtml5', 
                    text: '<i class="fa fa-files-o" aria-hidden="true"></i> Copiar',
                    title: $('title').html(),
                },
                { extend: 'print', 
                    text: '<i class="fa fa-print" aria-hidden="true"></i> Imprimir',
                    title: $('title').html(),
                },
                { extend: 'excel',
                  text: '<i class="fa fa-file-excel-o" aria-hidden="true"></i> Excel',
                  title: $('title').html(),
                }
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
                var init, fin;
                init = $('#aoIni').val();
                fin = $('#aoFin').val();

                reloadTBLinitial(init, fin);

                var ini = $('#aoIni').val();
                var fin = $('#aoFin').val();
                $('#graphs').load(aplicacion + '/ajax/ajx.reporte_ventas_pieChart.php?ini=' + ini + '&fin=' + fin);

                // Disable Input
                $('#aoIni').attr('disabled', 'disabled');
                $('#aoFin').attr('disabled', 'disabled');
                $('#buscar').hide(250);
                $('#limpiar').show(500);
            })
    		.submit(function(e){
    			e.preventDefault();
    		});

    	$("#limpiar").click(function () {
            window.location.href = window.location.href;
        });
    });
});

function reloadTBLinitial(init, fin) {
    $('#loading').show(200);

    if (init != '' && fin != ''){
        $.get(aplicacion + '/ajax/ajx.reporte_ventas.php?ini=' + init + '&fin=' + fin, function (data) { doRefresh(data, "#DataRV") });
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