var aplicacion = getCurrentHostname() + '/' + getUrlHTTP();
$(document).ready(function() {
    $("#DataVentasREDO").dataTable( {
        "bPaginate": true,
        "iDisplayLength": 10,
        "sPaginationType": "full_numbers",
        "processing": true,
        "sAjaxSource": aplicacion + '/ajax/ajx.reasignados.php',
        "bAutoWidth": true,
        "sDom": '<"top"B>frt<"bottom"ip><"clear">',
        "deferRender": true,
        "aoColumns": [
            { "mData": "id", "bSearchable": true, "sWidth": "20%", "sClass": "center"},
            { "mData": "fecha_venta", "bSearchable": true, "sWidth": "15%", "sClass": "center"},
            { "mData": "paciente", "bSearchable": true, "sWidth": "15%", "sClass": "center"},
            { "mData": "canal", "bSearchable": true, "sWidth": "40%", "sClass": "center"},
            { "mData": "accion", "bSearchable": false, "sWidth": "10%", "sClass": "center"}
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
    });
});

function reloadTBLinitial() {
    $.get(aplicacion + '/ajax/ajx.reasignados.php', function (data) {
        doRefresh(data, "#DataVentasREDO")
    });
}
function reasignado(idold, idnew){
  if ($.isNumeric(idold) && $.isNumeric(idnew) && idold != idnew){
      if (confirm("¿Esta seguro que desea reasignar la venta " + idold + " al registro " + idnew + " ?")){
        var parametros = {
            "oper": "Reasignado",
            "idnew": idnew,
            "idold": idold
        };
        $.ajax({
            url: aplicacion + '/ajax/ajx.reasignados_form.php',
            type: "POST",
            data: parametros,
            async: false,
            success: function(opciones) {
                if (opciones.indexOf("ERROR") != 0) {
                    alert('Se registró correctamente, ya puede cerrar esta ventana');
                    reloadTBLinitial();
                } else {
                    alert(opciones);
                }
            }
        });
      }
  } else {
    alert('El valor no es númerico')
  }


}
function doRefresh(data, id) {
    // data is a string
    data = jQuery.parseJSON(data);

    $(id).dataTable().fnClearTable();
    if (data.aaData.length)
        $(id).dataTable().fnAddData(data.aaData);
    $(id).dataTable().fnDraw();
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