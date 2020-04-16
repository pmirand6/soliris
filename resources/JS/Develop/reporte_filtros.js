var aplicacion = getCurrentHostname() + '/' + getUrlHTTP();
$.getScript(aplicacion + '/resources/JS/funciones.min.js', function(){
    $(document).ready(function() {
        var currentTime = new Date()

        $('#loading').hide();
        
        $('.date').datepicker({
            format: "dd-mm-yyyy",
            language: "es",
            endDate: getDate(),
            calendarWeeks: true,
            autoclose: true,
            clearBtn: true,
            todayHighlight: true
        });
        $('.dateFil').datepicker({
            format: "dd-mm-yyyy",
            language: "es",
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

        $("#DataFil").dataTable({
            "bPaginate": true,
            "iDisplayLength": 15,
            "sPaginationType": "full_numbers",
            "autoWidth": true,
            //"bAutoWidth": true,
            // "sDom": '<"top"B>rt<"bottom"ip><"clear">',
            "sDom": '<"top"<"pull-right"f><"pull-left"lB>>rt<"bottom"ip><"clear">',
            "processing": true,
            "sAjaxSource": aplicacion + '/ajax/ajx.reporte_filtros.php',
            // "deferRender": true,
            "aoColumns": [
                { "mData": "Registro", "bSearchable": true, "sWidth": "5%", "sClass": "center"},
			//	{ "mData": "Estado", "bSearchable": true, "sWidth": "5%", "sClass": "center"},
                { "mData": "Paciente", "bSearchable": true, "sWidth": "10%", "sClass": "center"},
                { "mData": "Abreviado", "bSearchable": true, "sWidth": "10%", "sClass": "center"},
                { "mData": "Sexo", "bSearchable": true, "sWidth": "5%", "sClass": "center"},
                { "mData": "Fecha_Nacimiento", "bSearchable": true, "sWidth": "7%", "sClass": "center"},
                { "mData": "C_Gestar", "bSearchable": true, "sWidth": "5%", "sClass": "center"},
                { "mData": "Edad", "bSearchable": true, "sWidth": "5%", "sClass": "center"},
                { "mData": "Medico", "bSearchable": true, "sWidth": "10%", "sClass": "center"},
				{ "mData": "Dosis", "bSearchable": true, "sWidth": "7%", "sClass": "center"},
				{ "mData": "Unidades", "bSearchable": true, "sWidth": "7%", "sClass": "center"},
                { "mData": "Fecha_Venta", "bSearchable": true, "sWidth": "7%", "sClass": "center"},
                { "mData": "Fecha_Cons", "bSearchable": true, "sWidth": "7%", "sClass": "center"},
                { "mData": "Patologia", "bSearchable": true, "sWidth": "10%", "sClass": "center"},
                { "mData": "Institucion", "bSearchable": true, "sWidth": "7%", "sClass": "center"},
                { "mData": "Canal", "bSearchable": true, "sWidth": "5%", "sClass": "center"},
                { "mData": "APM", "bSearchable": true, "sWidth": "5%", "sClass": "center"},
                { "mData": "C_Atencion", "bSearchable": true, "sWidth": "5%", "sClass": "center"},
                { "mData": "Tipo", "bSearchable": true, "sWidth": "1%", "sClass": "center"}

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
                    aoIni: {
                        message: 'La fecha inicial no es válida',
                        validators: {
                            notEmpty: {
                                message: 'La fecha inicial no puede quedar vacía'
                            },
                            date: {
                                message: 'La fecha inicial no puede ser superior a la fecha final',
                                format: 'DD-MM-YYYY',
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
                                format: 'DD-MM-YYYY',
                                min: 'aoIni'
                            }
                        }
                    }
                }})
            .on('success.form.fv', function(e) {
                // Prevent form submission
                e.preventDefault();

                var fecha;
                aoIni = $('#aoIni').val();
                aoFin = $('#aoFin').val();
                reloadTBLinitial(aoIni, aoFin);
            })
            .submit(function(e){
                e.preventDefault();
            });

        $('#DataFil tfoot th').each( function () {
            var title = $('#example thead th').eq( $(this).index() ).text();
            $(this).html( '<input type="text" placeholder="Filtrar '+title+'" />' );
        } );

        // DataTable
        var table = $('#DataFil').DataTable();

        // Apply the search
        table.columns().every( function () {
            var that = this;

            $( 'input', this.footer() ).on( 'keyup change', function () {
                if ( that.search() !== this.value ) {
                    that
                        .search( this.value )
                        .draw();
                }
            } );
        } );
    });
});


function reloadTBLinitial(aoIni, aoFin) {
    $('#loading').show(200);

    if (aoIni != '' && aoFin != '' ) {
        $.get(aplicacion + '/ajax/ajx.reporte_filtros.php?aoIni=' + aoIni + '&aoFin=' + aoFin, function (data) {
            doRefresh(data, "#DataFil")
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