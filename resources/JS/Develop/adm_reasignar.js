var aplicacion = getCurrentHostname() + '/' + getUrlHTTP();


$.getScript(aplicacion + '/resources/JS/funciones.min.js', function(){
    // script is now loaded and executed.
    // put your dependent JS here.
    $(document).ready(function() {
        $("#DataReasignar").dataTable( {
            "bPaginate": true,
            "iDisplayLength": 10,
            "sPaginationType": "full_numbers",
            "processing": true,
            "sAjaxSource": '../ajax/ajx.adm_reasignar.php',
            "bAutoWidth": true,
            "sDom": '<"top"B>frt<"bottom"ip><"clear">',
            "deferRender": true,
            "aoColumns": [
                { "mData": "id", "bSearchable": true, "sWidth": "5%", "sClass": "center"},
                { "mData": "paciente", "bSearchable": true, "sWidth": "20%", "sClass": "center"},
                { "mData": "sexo", "bSearchable": true, "sWidth": "5%", "sClass": "center"},
                { "mData": "fnac", "bSearchable": true, "sWidth": "10%", "sClass": "center"},
                { "mData": "edad", "bSearchable": true, "sWidth": "10%", "sClass": "center"},
                { "mData": "patologia", "bSearchable": true, "sWidth": "15%", "sClass": "center"},
                { "mData": "estado", "bSearchable": true, "sWidth": "10%", "sClass": "center"},
                { "mData": "documentacion", "bSearchable": true, "sWidth": "15%", "sClass": "center"},
                { "mData": "acciones", "bSearchable": true, "sWidth": "10%", "sClass": "center"}
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
});

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
function viewDetails(id){
    $('#win').window('open');  // close a window
    $('#win_list').attr('src', aplicacion + '/main/listado_details.php?id=' + id);
}


function getCurrentHostname() {
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