<?php

require_once("../config/config.php");
include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
include_once $_SERVER['DOCUMENT_ROOT'] . _FN;



$SQL = "CALL `ST_LIST_PATOLOGIAS`();";
$result = mysqli_query($db, $SQL);

$arr_tbody = '
<html>
    <head>
        <style type="text/css">
            /* Style DataTables Bootstrap*/
                @import "' . HTTP . '/resources/DataTables/datatables.min.css";
            /* Iconos de Estados */
                @import "' . HTTP . '/resources/Sprites/TBL-icons.css";
        </style>

        <script type="text/javascript">
            $(document).ready(function() {
                $("#TBLPatologia").dataTable( {
                    "bPaginate": true,
                    "iDisplayLength": 10,
                    "sPaginationType": "full_numbers",
                    "processing": true,
                    "deferRender": true,
                    "sDom": \'<"top"B>frt<"bottom"ip><"clear">\',
                    "aoColumns": [
                               { "bSearchable": true, "bVisible": false, "sClass": "center"},
                               { "bSearchable": true, "sWidth": "40%", "sClass": "center"},
                               { "bSearchable": true, "sWidth": "30%", "sClass": "center"},
                               { "bSearchable": true, "sWidth": "20%", "sClass": "center"},
                               { "bSearchable": true, "sWidth": "10%", "sClass": "center" }
                    ],
                    "buttons": [
                        { extend: \'copyHtml5\', text: \'<i class="fa fa-files-o" aria-hidden="true"></i> Copiar\'},
                        { extend: \'print\', text: \'<i class="fa fa-print" aria-hidden="true"></i> Imprimir\'},
                        { extend: \'excel\', text: \'<i class="fa fa-file-excel-o" aria-hidden="true"></i> Excel\'}
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
                                copyTitle: \'Copiado al Portapapeles\',
                                copyKeys: \'Presione <i>CRTL</i> ó <i>\u2318</i> + <i>C</i> para copiar la tabla en el documento que desee. <br><br>Para cancelar, haga click sobre este mensaje o presione la tecla ESC.\'
                            }
                    }
                });
            });
        </script>
    </head>
    <body>
        <table cellpadding="0" cellspacing="0" border="0" class="table table-bordered" id="TBLPatologia" style="font-size: 13px">
            <thead>
                <tr>
                    <th> id </th>
                    <th> Nombre </th>
                    <th> Estado </th>
                    <th> Familia </th>
                    <th> Acciones </th>
                </tr>
            </thead>
            <tbody>';
while ($row = mysqli_fetch_assoc($result)) {
    $arr_tbody .= "<tr class=\"TBLrows\">";
    $arr_tbody .= '<td>' . $row["id"] . '</td>';
    $arr_tbody .= '<td><b class="pointer" onclick="callPatologia(\'' . $row["id"] . '\')">' . ucwords(strtolower($row["patologia_nombre"])) . '</b></td>';
    $arr_tbody .= "<td><div class=\"TBL TBL-" . str_replace(" ", "_", $row["estado"]) . "\" title=\"" . $row["estado"] . "\"><p class=\"hidden\">" . $row["estado"] . "</p></div></td>";
    $arr_tbody .= '<td>' . $row["familia"] . '</td>';
    if ($row["estado"] == 'Activo') {
        $arr_tbody .= '<td><button type=\'button\' class=\'del_can btn btn-danger\' title=\'Desactivar\' style=\'margin-left: 13px;\' onclick="delPatologia(\'' . $row["id"] . '\')"><i class=\'fa fa-ban\'></i></button></td>';
    } else {
        $arr_tbody .= '<td><button type=\'button\' class=\'act_can btn btn-success\' title=\'Activar\' style=\'margin-left: 13px;\' onclick="actPatologia(\'' . $row["id"] . '\')"><i class=\'fa fa-undo\'></i></button></td>';
    }
    $arr_tbody .= '</tr>';
};

mysqli_free_result($result);
mysqli_close($db);

$arr_tbody .= "


            </tbody>
        </table>
    </body>
</html>";

echo $arr_tbody;
