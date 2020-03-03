var aplicacion = getCurrentHostname() + '/' + getUrlHTTP();
$(document).ready(function() {
    $("#DataTRPA").dataTable( {
        "bPaginate": true,
        "iDisplayLength": 10,
        "sPaginationType": "full_numbers",
        "bAutoWidth": true,
        "sDom": '<"top"T>frt<"bottom"ip><"clear">',
        "deferRender": true,
        "oTableTools": {
            "aButtons": [
                "copy",
                "xls"
            ],
            "sSwfPath": aplicacion + '/resources/DataTables/TableTools-2.0.0/media/swf/copy_csv_xls_pdf.swf'
        },
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