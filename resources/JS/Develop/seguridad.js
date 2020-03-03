/**
 * Created by jgallina on 06/05/2015.
 */
var aplicacion = getCurrentHostname() + '/' + getUrlHTTP();
$(document).ready(function() {
    $('#newSeg').click(function () {
        $('#ModalLabel').html('Nueva Pagina');

        $('#guardar').show();
        $('#eliminar').hide();

        $('#Modal').modal('show');
    });

    // DataTable
    $("#TBLUsr").dataTable({
            "bPaginate": true,
            "iDisplayLength": 10,
            "sPaginationType": "full_numbers",
            "processing": true,
            "sAjaxSource": aplicacion + '/ajax/ajx.seguridad.php',
            "order": [[ 1, "asc" ]],
            "sDom": '<"top"<"pull-right"f><"pull-left"lB>>rt<"bottom"ip><"clear">',
            "aoColumns": [
                { "mData": "id", "bSearchable": true, "bVisible": false, "sClass": "center"},
                { "mData": "pagina", "bSearchable": true, "sWidth": "20%", "sClass": "center"},
                { "mData": "descripcion", "bSearchable": true, "sWidth": "20%", "sClass": "center"},
                { "mData": "admin", "bSearchable": true, "sWidth": "10%", "sClass": "center"},
                { "mData": "fv", "bSearchable": true, "sWidth": "10%", "sClass": "center"},
                { "mData": "marketing", "bSearchable": true, "sWidth": "10%", "sClass": "center"},
                { "mData": "ventas", "bSearchable": true, "sWidth": "10%", "sClass": "center"},
                { "mData": "auditor", "bSearchable": true, "sWidth": "10%", "sClass": "center" },
				{ "mData": "apm", "bSearchable": true, "sWidth": "10%", "sClass": "center" },
                { "mData": "accion", "bSearchable": true, "sWidth": "5%", "sClass": "center" }
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
                                copyKeys: 'Presione <i>CRTL</i> ó <i>\u2318</i> + <i>C</i> para copiar la tabla en el documento que desee. <br><br>Para cancelar, haga click sobre este mensaje o presione la tecla ESC.'
                            }
        }
    });

    // Validación del Formulario
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
                descripcion: {
                    message: 'La descripción no es válida',
                    validators: {
                        regexp: {
                            regexp: /^[0-9a-zA-ZñÑáéíóúÁÉÍÓÚ\s]*$/,
                            message: 'La descripción contener solo letras y/o números.'
                        },
                        stringLength: {
                            min: 4,
                            max: 100,
                            message: 'La descripción debe contener como mínimo 4 y como máximo 100 letras'
                        }
                    }
                },
                pagina: {
                    message: 'La página no es válida',
                    validators: {
                        notEmpty: {
                            message: 'La dirección de la página no puede quedar vacío'
                        },
                        stringLength: {
                            min: 5,
                            max: 90,
                            message: 'La dirección página debe contener como mínimo 5 y como máximo 90 caracteres'
                        },
                        regexp: {
                            regexp: /\.(php)$/, //Validación para extension PHP
                            message: 'El formato de la página no es válido'
                        }

                    }
                }
            }
        })
        .on('success.form.fv', function(e) {
            // Prevent form submission
            e.preventDefault();

            var parametros = {
                "oper": "Guardar",
                "pagina": $('#pagina').val(),
                "descripcion": $('#descripcion').val()
            };
            $.ajax({
                url: aplicacion + '/ajax/ajx.seguridad_form.php',
                type: "POST",
                data: parametros,
                success: function (opciones) {
                    if (opciones.indexOf("ERROR")  != 0) {
                        alert('Se registró correctamente, ya puede cerrar esta ventana');
                        reloadTBLinitial();
                    }else{
                        alert(opciones);
                    }
                    $('#Modal').modal('hide');
                }
            });
        })
		.submit(function(e) {
			e.preventDefault();
		});

    // Bind "+" para abrir el Modal
    $("body").keypress(function( event ) {
        if (event.which == 43) {
            $('#ModalLabel').html('Nueva Pagina');

            $('#guardar').show();
            $('#eliminar').hide();

            $('#Modal').modal('show');
        }
    });
    // Auto Focus al abrir el Modal
    $('body').on('shown.bs.modal', '.modal', function () {
        $('[id$=pagina]').focus();
    })
});

function reloadTBLinitial(init) {
    $.get(aplicacion + '/ajax/ajx.seguridad.php', function (data) { doRefresh(data, "#TBLUsr") });
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
function delSeg(id) {
    if (confirm('Desea Eliminar a esta Página?')){
        var parametros = {
            "oper": "Eliminar",
            "id": id
        };
        $.ajax({
            url: aplicacion + '/ajax/ajx.seguridad_form.php',
            type: "POST",
            data: parametros,
            success: function (opciones) {
                if (opciones.indexOf("ERROR")  != 0) {
                    alert('Se eliminó la página correctamente');
                    reloadTBLinitial();
                    $('#Modal').modal('hide');
                }else{
                    alert(opciones);
                    $('#Modal').modal('hide');
                }
            }
        });
    }
}
function setPermisos(obj, id, valor){
    var parametros = {
        "oper": "SetPermisos",
        "id": id,
        "grupo": valor
    };
    $.ajax({
        url: aplicacion + '/ajax/ajx.seguridad_form.php',
        type: "POST",
        data: parametros,
        success: function (opciones) {
            //window.location.href = window.location.href;
            reloadTBLinitial()
        }
    });
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