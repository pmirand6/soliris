/**
 * Created by jgallina on 30/04/2015.
 */
var aplicacion = getCurrentHostname() + '/' + getUrlHTTP();
$(document).ready(function() {
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
                id: {
                    message: 'El id del registro no es válido',
                    validators: {
                        notEmpty: {
                            message: 'El id del registro no puede quedar vacío'
                        },
                        digits: {
                            message: 'El id del registro solo puede estar formado por números'
                        }
                    }
                }
            }
        })
        .on('success.form.fv', function(e) {
            // Prevent form submission
            e.preventDefault();
            reloadTBLinitial($('#id').val());
        })
		.submit(function(e){
			e.preventDefault();
		});

    $('#TBLLog tfoot th').each( function () {
        var title = $(this).text();
        $(this).html( '<input type="text" placeholder="Buscar '+title+'" />' );
    });


    var table_log = $("#TBLLog").DataTable( {
        "bPaginate": true,
        "autoWidth": false,
        "iDisplayLength": 10,
        "sPaginationType": "full_numbers",
        "processing": true,
        "sAjaxSource": aplicacion + '/ajax/ajx.log.php',
        "sDom": '<"top"B>rt<"bottom"ip><"clear">',
        "order": [[ 3, "desc" ]],
        "aoColumns": [
            { "mData": "id", "bSearchable": true, "bVisible": false, "sClass": "center"},
            { "mData": "registro", "bSearchable": true, "sWidth": "20%", "sClass": "center"},
            { "mData": "accion", "bSearchable": true, "sWidth": "40%", "sClass": "center"},
            { "mData": "fecha", "bSearchable": true, "sWidth": "10%", "sClass": "center"},
            { "mData": "usuario", "bSearchable": true, "sWidth": "10%", "sClass": "center"},
            { "mData": "notas", "bSearchable": true, "sWidth": "20%", "sClass": "center"}
        ],
        "buttons": [
            { extend: 'copyHtml5', text: '<i class="fa fa-files-o" aria-hidden="true"></i> Copiar'},
            { extend: 'print', text: '<i class="fa fa-print" aria-hidden="true"></i> Imprimir'},
            { extend: 'excel', text: '<i class="fa fa-file-excel-o" aria-hidden="true"></i> Excel'}
        ],
       "oLanguage": {
                "sSearch": "Filtrar:",
                "sLengthMenu": "Mostrar _MENU_ registros",
                "oPaginate": {
                    "sFirst": "Primero",
                    "sPrevious": "Anterior",
                    "sNext": "Siguiente",
                    "sLast": "Último"
                },
                "sEmptyTable": "No se encontraron registros",
                "sZeroRecords": "No se encontraron registros",
                "sInfo": "Mostrando (_START_ a _END_ registro/s). Total de registro/s: _TOTAL_ ",
                "sInfoEmpty": "No se encontraron registros",
                "sProcessing": "Procesando",
                "sInfoFiltered": "(Filtrados de un total de _TOTAL_ registros)",
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

    table_log.columns().every( function () {
        var that = this;
 
        $( 'input', this.footer() ).on( 'keyup change', function () {
            if ( that.search() !== this.value ) {
                that
                    .search( this.value )
                    .draw();
            }
        });
    });


});

function reloadTBLinitial(init) {
    if (init != ''){
        $.get(aplicacion + '/ajax/ajx.log.php?id=' + init, function (data) { doRefresh(data, "#TBLLog") });
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