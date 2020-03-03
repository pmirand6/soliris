var aplicacion = getCurrentHostname() + '/' + getUrlHTTP();
$.getScript(aplicacion + '/resources/JS/funciones.min.js', function () {
    $(document).ready(function () {

        //obtener id del paciente

        var parts = window.location.search.substr(1).split("&");
        var $_GET = {};

        for (var i = 0; i < parts.length; i++) {
            var temp = parts[i].split("=");
            $_GET[decodeURIComponent(temp[0])] = decodeURIComponent(temp[1]);
        }

        var idPac = $_GET["id"];


        $("#PacDat").dataTable({
            "ajax": {
                "url": aplicacion + '/ajax/ajx.informes_dat_pac.php?id=' + idPac,
                "dataSrc": "data"
            },
            "destroy": true,
            "bPaginate": true,
            "iDisplayLength": 5,
            "sPaginationType": "full_numbers",
            "bAutoWidth": true,
            //"sDom": '<"top"B>frt<"bottom"ip><"clear">',
            "dom": '<"top"B>rt<"bottom"ip><"clear">',
            "deferRender": true,
            "columns": [{
                    "data": "Nombre"
                }, // 0
                {
                    "data": "sexo"
                }, // 1
                {
                    "data": "c_gestar"
                }, // 2
                {
                    "data": "f_nac"
                }, // 3
                {
                    "data": "edad"
                }, // 4
                {
                    "data": "patologia"
                }, // 5
                {
                    "data": "estado"
                }, // 6
                {
                    "data": "documentos"
                } // 7
            ],
            "columnDefs": [{
                    //funcion para obtener los iconos de estado en la columna 10
                    "render": function (data, type, row) {
                        var datos = data;
                        return estado_icon(data);
                    },
                    "targets": [6],
                    "searchable": false
                },
                {
                    //funcion para obtener los iconos de documentos en la columna 10
                    "render": function (data, type, row) {
                        campo = '<ul class="docs">';
                        if (data.indexOf(';') > -1) {
                            var string = data.split(";");
                            var campo = '';
                            for (pos = 0; pos < string.length; pos++) {
                                campo += docs_icon(string[pos]);
                            }
                        } else {
                            campo += docs_icon(data);
                        }
                        return campo + '</ul>';
                    },
                    "targets": [7],
                    "visible": true,
                    "searchable": false
                }
            ],
            "buttons": [{
                    extend: 'copyHtml5',
                    text: '<i class="fa fa-files-o" aria-hidden="true"></i> Copiar'
                },
                {
                    extend: 'print',
                    text: '<i class="fa fa-print" aria-hidden="true"></i> Imprimir'
                },
                {
                    extend: 'excel',
                    text: '<i class="fa fa-file-excel-o" aria-hidden="true"></i> Excel'
                }
            ],
            "oLanguage": {
                "sProcessing": "Procesando...",
                "sLengthMenu": "Mostrar _MENU_ registros",
                "sZeroRecords": "No se encontraron resultados",
                "sEmptyTable": "Ningún dato disponible en esta tabla",
                "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
                "sInfoPostFix": "",
                "sSearch": "Buscar:",
                "sUrl": "",
                "sInfoThousands": ",",
                "sLoadingRecords": "Cargando...",
                "oPaginate": {
                    "sFirst": "Primero",
                    "sLast": "Último",
                    "sNext": "Siguiente",
                    "sPrevious": "Anterior"
                },
                "oAria": {
                    "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                    "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                }
            }
        });




        $('#loading').hide(200);


    });
});


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