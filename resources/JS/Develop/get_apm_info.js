/**
 * Created by jgallina on 30/04/2015.
 */
var aplicacion = getCurrentHostname() + '/' + getUrlHTTP();
$(document).ready(function() {
    $('.form')
        /*.on('success.form.fv', function(e) {
            // Prevent form submission
            e.preventDefault();
           
        })*/
		.submit(function(e){
			e.preventDefault();
			 reloadTBLinitial($('#medico').val(),$('#centro').val());
		});


    $("#DataTPacientes").dataTable( {
        "bPaginate": true,
        "iDisplayLength": 10,
        "sPaginationType": "full_numbers",
        "processing": true,
        "sAjaxSource": aplicacion + '/ajax/ajx.apm_info.php',
        "sDom": '<"top"B>rt<"bottom"ip><"clear">',
        "order": [[ 3, "desc" ]],
        "aoColumns": [
            { "mData": "paciente", "bSearchable": true, "bVisible": false, "sClass": "center"},
            { "mData": "venta", "bSearchable": true, "sWidth": "20%", "sClass": "center"},
            { "mData": "dosis", "bSearchable": true, "sWidth": "40%", "sClass": "center"},
            { "mData": "unidad", "bSearchable": true, "sWidth": "10%", "sClass": "center"},
            { "mData": "tipo", "bSearchable": true, "sWidth": "10%", "sClass": "center"},
            { "mData": "medico", "bSearchable": true, "sWidth": "20%", "sClass": "center"},
			{ "mData": "patologia", "bSearchable": true, "sWidth": "20%", "sClass": "center"},
			{ "mData": "institucion", "bSearchable": true, "sWidth": "20%", "sClass": "center"},
			{ "mData": "ca", "bSearchable": true, "sWidth": "20%", "sClass": "center"},
			{ "mData": "canal", "bSearchable": true, "sWidth": "20%", "sClass": "center"}
			
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

function reloadTBLinitial(medico,centro) {
    if (medico != '' || centro !=''){
        $.get(aplicacion + '/ajax/ajx.apm_info.php?medico=' + medico + '&centro=' + centro, function (data) { doRefresh(data, "#DataTPacientes") });
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