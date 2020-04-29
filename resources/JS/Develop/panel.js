//VARIABLES GLOBALES

var grupo_usuario = ""; //VARIABLE DE GRUPO DE USUARIO
var acciones = ""; //VARIABLE DE ACCION SOBRE LOS REGISTROS
var ocultar_columna = ""; //OCULTA LA COLUMNA PARA LOS USUARIOS QUE NO PERTENECE AL GRUPO FV ó ADMIN
var aplicacion = getCurrentHostname() + '/' + getUrlHTTP();


$.getScript(aplicacion + '/resources/JS/funciones.min.js', function() {
    // script is now loaded and executed.
    // put your dependent JS here.
    $(document).ready(function() {
        $("#win").window({
          modal: true,
          closed: true,
          minimizable: false,
          maximizable: false,
          title:'Ver Historial',
          closeOnEscape: true, 
          draggable: false,
          maximized:true, 
          inline:true,
          collapsible: false,
          constrain: true,
          onBeforeClose: function() {
            window.location.href = window.location.href;
          }
        });
		//VENTAS SIN NP
		 $("#DataDVP").DataTable({
            ajax: {
                url: aplicacion + '/ajax/ajx.panel.php',
                data: {
                    oper: 'DataDVP'
                },
                method: 'POST'
            },
            "bPaginate": true,
            "iDisplayLength": 5,
            "sPaginationType": "full_numbers",
            "processing": true,
            //"sAjaxSource": aplicacion + '/ajax/ajx.panel.php?oper=DataPPA',
            "bAutoWidth": true,
            "sDom": '<"top"B>frt<"bottom"ip><"clear">',
            "deferRender": true,
            "columns": [
				{
                "data": "id_venta"
                }, // 0
                {
                    "data": "name"
                }, // 1
                {
                    "data": "sexo"
                }, // 2
                {
                    "data": "cgestar"
                }, // 4
                {
                    "data": "edad"
                },
                {
                    "data": "patologia"
                }, // 5
                {
                    "data": "venta"
                }, // 6
                {
                    "data": "tventa"
                }, 
                {
                    "data": "cod_venta"
                }, 
				{
                    "data": "estado"
                }               
                
                ],
                "columnDefs": [
               
                {"render": function(data, type, row) {
                            var sexo = data;
                            return sexo_icon(data);
                        },
                    "targets": [2],
                    "searchable": false
                }],
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
   

        // // DataTable Ventas Pendientes de NP
        // $("#DataDVP").dataTable({
        //     "ajax": {
        //         "url": aplicacion + '/ajax/ajx.panel.php?oper=DataGDP&grupo=' + grupo_usuario,
        //         "dataSrc": "data",
        //     },
        //     "deferRender": true,
        //     "bPaginate": true,
        //     "iDisplayLength": 5,
        //     "sPaginationType": "full_numbers",
        //     "processing": true,
        //     "bAutoWidth": true,
        //     "sDom": '<"top"B>frt<"bottom"ip><"clear">',
        //     "columns": [{
        //         "data": "id",
        //         "visible": false,
        //         "searchable": false
        //         }, // 0
        //         {
        //             "data": "IDPac",
        //             "visible": false,
        //             "searchable": false
        //         }, // 1
        //         {
        //             "data": "nombrePaciente"
        //         }, // 2
        //         {
        //             "data": "sexo"
        //         }, // 3
        //         {
        //             "data": "c_gestar"
        //         }, // 4
        //         {
        //             "data": "f_nac"
        //         }, // 5
        //         {
        //             "data": "uventa"
        //         }, // 6
        //         {
        //             "data": "edad"
        //         }, // 7
        //         {
        //             "data": "patologia"
        //         }, // 8
        //         {
        //             "data": "estado"
        //         }, // 9
        //         {
        //             "data": "documentos",
        //             "class": "docs"
        //         }, // 10
        //         {
        //             "data": function(data, type, dataToSet) {

        //                 switch (grupo_usuario) {
        //                     case 'FV':
        //                     return "<div class='btn btn-sm btn-default pointer boton' title='Ver el Registro' onclick='viewDetails(" + data.id + ");'><div class='TBL TBL-Accion'><p class='hidden'></p></div></div>";
        //                     break;
        //                     case 'Admin':
        //                     return "<div class='btn btn-sm btn-default pointer boton' title='Ver el Registro' onclick='viewDetails(" + data.id + ");'><div class='TBL TBL-Accion'><p class='hidden'></p></div></div>";
        //                     break;
        //                     default:
        //                     return "<div class='btn btn-sm btn-default pointer boton' title='Ver el Registro' onclick='viewDetailsProd(" + data.id + ", " + data.IDPac + ");'><div class='TBL TBL-Accion'><p class='hidden'></p></div></div>";
        //                     break;
        //                 }
        //             }
        //         } // 11

        //         ],
        //         "columnDefs": [{
        //             // funcion para obtener el icono del sexo
        //             "render": function(data, type, row) {
        //                 var sexo = data;
        //                 return sexo_icon(data);
        //             },
        //             "targets": [3],
        //             "searchable": false
        //         }, {
        //             //funcion para obtener los iconos de estado en la columna 9
        //             "render": function(data, type, row) {
        //                 var datos = data;
        //                 return estado_icon(data);


        //             },
        //             "targets": [9],
        //             "searchable": false
        //         }, {
        //             //funcion para obtener los iconos de los documentos en la columna 10
        //             "render": function(data, type, row) {
        //                 campo = '<ul>';
        //                 if (data == null) {
        //                     data = 'Sin Documentacion'
        //                 }
        //                 if (data.indexOf(';') > -1) {
        //                     var string = data.split(";");
        //                     var campo = '';
        //                     for (pos = 0; pos < string.length; pos++) {
        //                         campo += docs_icon(string[pos]);
        //                     }
        //                 } else {
        //                     campo += docs_icon(data);
        //                 }
        //                 return campo + '</ul>';
        //             },
        //             "targets": [10],
        //             "visible": true,
        //             "searchable": false
        //         }

        //         ],
        //         "buttons": [
        //         { extend: 'copyHtml5', text: '<i class="fa fa-files-o" aria-hidden="true"></i> Copiar'},
        //         { extend: 'print', text: '<i class="fa fa-print" aria-hidden="true"></i> Imprimir'},
        //         { extend: 'excel', text: '<i class="fa fa-file-excel-o" aria-hidden="true"></i> Excel'}
        //         ],

        //         "oLanguage": {
        //             "sSearch": "Filtrar:",
        //             "sLengthMenu": "Mostrar _MENU_ registros",
        //             "oPaginate": {
        //                 "sFirst": "Primero",
        //                 "sPrevious": "Anterior",
        //                 "sNext": "Siguiente",
        //                 "sLast": "Último"
        //             },
        //             "sEmptyTable": "No se encontraron registros",
        //             "sZeroRecords": "No se encontraron registros",
        //             "sInfo": "Mostrando (_START_ a _END_ registro/s). Total de registro/s: _TOTAL_ ",
        //             "sInfoEmpty": "No se encontraron registros",
        //             "sProcessing": "Procesando",
        //             "sInfoFiltered": "(Filtrados de un total de _TOTAL_ registros)",
        //             buttons: {
        //                 copyTitle: 'Copiado al Portapapeles',
        //                 copyKeys: 'Presione <i>CRTL</i> ó <i>\u2318</i> + <i>C</i> para copiar la tabla en el documento que desee. <br><br>Para cancelar, haga click sobre este mensaje o presione la tecla ESC.',
        //                 copySuccess: {
        //                     _: '%d líneas copiadas',
        //                     1: '1 línea copiada'
        //                 }
        //             }
        //         }

        //     });


        // DATATABLE Pacientes Pendiente de Activarse [hasta 90 dias]
        $("#DataPPA").DataTable({
            ajax: {
                url: aplicacion + '/ajax/ajx.panel.php',
                data: {
                    oper: 'DataPPA'
                },
                method: 'POST'
            },
            "bPaginate": true,
            "iDisplayLength": 5,
            "sPaginationType": "full_numbers",
            "processing": true,
            //"sAjaxSource": aplicacion + '/ajax/ajx.panel.php?oper=DataPPA',
            "bAutoWidth": true,
            "sDom": '<"top"B>frt<"bottom"ip><"clear">',
            "deferRender": true,
            "columns": [{
                "data": "id",
                "visible": false,
                "searchable": false
                }, // 0
                {
                    "data": "name"
                }, // 1
                {
                    "data": "sexo"
                }, // 2
                {
                    "data": "fnac"
                }, // 4
                {
                    "data": "patologia_nombre"
                },
                {
                    "data": "sub_patologia_nombre"
                }, // 5
                {
                    "data": "estado"
                }, // 6
                
                {
                    "data": function(data, type, dataToSet) {
                        return "<div class='btn btn-sm btn-default pointer boton' title='Ver el Registro' onclick='viewDetailsPAC(" + data.id + ");'><div class='TBL TBL-Accion'><p class='hidden'></p></div></div>";
                    }
                } // 8
                ],
                "columnDefs": [
                { //funcion para obtener los iconos de estado en la columna 9
                    "render": function(data, type, row) {
                        var datos = data;
                        return estado_icon(data);
                    },
                    "targets": [6],
                    "searchable": false
                },
                {"render": function(data, type, row) {
                            var sexo = data;
                            return sexo_icon(data);
                        },
                    "targets": [2],
                    "searchable": false
                }],
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
    });
});

function reloadTBLinitial(init) {
    $('#' + init).html('<span class="fa fa-spinner fa-pulse"></span>');
    if (init != '') {
        $.get(aplicacion + '/ajax/ajx.listadoHV.php?ini=' + init, function(data) {
            doRefresh(data, "#DataHVentas")
            $('#' + init).html(init)
        });
    } else {
        $.get(aplicacion + '/ajax/ajx.listadoHV.php', function(data) {
            doRefresh(data, "#DataHVentas")
            $('#' + init).html(init)
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
}

function getData(idDest, aRow, id, nroCol) {
    if ($(id).dataTable().fnGetData(aRow) != '' || nroCol != '') {
        $('#' + idDest).val($(id).dataTable().fnGetData(aRow)[nroCol]);
    }
}

function viewDetails(id) {

    var acc = acciones;
    $('#win').window('open'); // close a window
    $('#win_list').attr('src', aplicacion + '/main/panel_mod.php?id=' + id + '&acc=' + acc);
}

function viewDetailsPAC(id) {
    $('#win').window('open'); // close a window
        localStorage.removeItem('paramPaciente');
        const paramPaciente = {
            idPac: id
        }
        window.localStorage.setItem('paramPaciente', JSON.stringify(paramPaciente));
        
    $('#win_list').attr('src', aplicacion + '/administrador/paciente.php?id=' + id);
}

function viewDetailsProd(id, id_paciente) {
    $('#win').window('open'); // close a window
    $('#win_list').attr('src', aplicacion + '/main/informes_nue_pres.php?id=' + id_paciente + '&idMst=' + id);
}

function session_group(grupo, accion) {

    //funcion para setear las variables globales

    grupo_usuario = grupo;
    acciones = accion;

    switch (grupo_usuario) {
        case 'FV':
        ocultar_columna = true;
        break;
        case 'Admin':
        ocultar_columna = true;
        break;
        default:
        ocultar_columna = false;
        break;
    }
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
