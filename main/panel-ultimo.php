<?php

require('../config/config.php');
include $_SERVER['DOCUMENT_ROOT'] . _BD;
include $_SERVER['DOCUMENT_ROOT'] . _FN;
include $_SERVER['DOCUMENT_ROOT'] . _SG;


?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height">

    <title>Panel soliris</title>

    <style type="text/css">
        /* Latest compiled and minified CSS */
        @import "../resources/Bootstrap-3.3.1/css/bootstrap.min.css";
        /* Optional theme */
        @import "../resources/Bootstrap-3.3.1/css/bootstrap-theme.min.css";
        /* Font-Awesome */
        @import "../resources/CSS/Font-Awesome-4.5.0/css/font-awesome.min.css";
        /* EasyUI */
        @import "../resources/JQuery-EasyUI-1.4.2/themes/bootstrap/easyui.css";
        /* Style DataTables Bootstrap*/
        @import "../resources/DataTables/datatables.min.css";
        /* Iconos de Estados */
        @import "../resources/Sprites/spriteListado.css";
        /* Custom CSS */
        @import "../resources/CSS/Develop/panel.css";
    </style>

    <?php
    if (strtoupper($_SESSION["grupo"]) == "FV" OR strtoupper($_SESSION["grupo"]) == "ADMIN") { $var_grupo = 1; }
    if (strtoupper($_SESSION["grupo"]) == "VENTAS" OR strtoupper($_SESSION["grupo"]) == "MARKETING") { $var_grupo = 2; }


    switch ($var_grupo) {
        case 1:
        $titulo = "Documentos Pendientes de Autorizar";
        $estado = " (RM.estado IN ('Pendiente', 'FV', 'Postergado') OR RM.estado IS NULL)";
        $limite = "";
        $acc = "nu";
        break;
        case 2:
        $titulo = "Documentos Devueltos";
        $estado = " RM.estado IN ('Autorizado', 'Rechazado', 'Documentacion') ";
        $limite = "";
        $acc = "up";
        break;

        default:
        $titulo = "Documentos Pendientes Globales";
        $estado = " RM.estado IN ('Autorizado', 'Pendiente') ";
        $limite = " AND datediff(now(), RM.autoriza_fecha) < 30 ";
        $acc = "";
        break;
    }
    ?>
</head>
<body >
    <!--  Buscar Historial Ventas  -->
    <div class="row col-sm-12 col-xs-12 text-left">
        <h3>
            <img src="../resources/IMG/Home.png" style="margin-left:20px;width:32px;">
            <samp style="font-family: 'Ubuntu Condense', Helvetica, Arial, sans-serif;vertical-align: top;">Panel soliris</samp>
        </h3>
    </div>
    <div class="col-sm-8 col-xs-8 text-left">
        <samp style="font-family: 'Ubuntu Condense', Helvetica, Arial, sans-serif;vertical-align: top;"><b><?php  echo $titulo; ?></b></samp>
    </div>

    <div class="row col-sm-12 col-xs-12 box1">

        <!--  Header  -->
        
        <!--  DataTable Documentos Pendientes Globales  -->
        <table cellpadding="0" cellspacing="0" border="0" class="table table-bordered" id="DataDPG" style="font-size: 13px">
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Sexo</th>
                    <th>C. Ges</th>
                    <th>F. Nac (DD/MM/YYYY)</th>
                    <th>U. Venta (DD/MM/YYYY)</th>
                    <th>Edad</th>
                    <th>Patología</th>
                    <th>Estado</th>
                    <th>Documentación</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <?php


                $SQL = "
                SELECT
                RM.id AS id,
                RM.sexo AS sexo,
                DATE_FORMAT(RM.fecha_nac, '%d/%m/%Y') AS f_nac,
                RM.edad AS edad, RM.patologia AS patologia,
                RM.nombre AS nombre, RM.estado AS estado,
                P.Nombre AS nombrePaciente,
                (SELECT DATE_FORMAT(fecha_venta, '%d/%m/%Y')  FROM soliris_maestro AS RM WHERE RM.nombre = P.id ORDER BY RM.fecha_venta DESC LIMIT 1, 1) as uventa,
                P.c_gestar AS c_gestar,
                (SELECT GROUP_CONCAT(RD.documento) FROM soliris_documentacion as RD where RD.referencia = 'soliris_maestro' AND RD.id_maestro = RM.id) as documentos
                FROM
                soliris_maestro AS RM LEFT JOIN pacientes as P ON (RM.nombre = P.id)
                WHERE
                $estado $limite
                ORDER BY
                RM.id DESC;";



                $result = mysqli_query($db, $SQL);
                while ($row = mysqli_fetch_assoc($result)) {
                    $id = $row["id"];
                    $sexo = $row["sexo"];
                    $estado = $row["estado"];

                    echo "<tr class=\"TBLrows\">";
                    echo '<td>' . ucwords(strtolower($row["nombrePaciente"])) . '</td>';
                    echo '<td>' . "<samp class=\"TBL TBL-$sexo\" title=\"" . l_stringSexo($row["sexo"]) . "\"><p class=\"hidden\">$sexo</p></samp>" . '</td>';
                    echo '<td>' . $row["c_gestar"] . '</td>';
                    echo '<td>' . $row["f_nac"] . '</td>';
                    echo '<td>' . $row["uventa"] . '</td>';
                    echo '<td>' . $row["edad"] . '</td>';
                    echo '<td>' . $row["patologia"] . '</td>';
                    echo '<td>' . "<samp class=\"TBL TBL-" . str_replace(" ", "-", $estado) . "\" title=\"$estado\"><p class=\"hidden \">$estado</p></samp>" . '</td>';
                    echo '<td>' . "<ul>" . "hola" . l_str_docus($row["documentos"]) . "</ul>" . '</td>';
                    echo '<td><div class="btn btn-sm btn-default pointer" title="Ver el Registro" onclick="viewDetails(\'' . $id . '\', \'' . $acc . '\')"><div class="TBL TBL-Accion"><p class="hidden"></p></div></td></td>';
                    echo '</tr>';
                };
                mysqli_free_result($result);
                mysqli_close($db);
                ?>


            </tbody>
        </table>
    </div>

    <div class="row col-sm-12 col-xs-12">&nbsp;</div>

    <div class="row col-sm-12 col-xs-12 box2">
        <div class="col-sm-8 col-xs-8 text-left">
            <samp style="font-family: 'Ubuntu Condense', Helvetica, Arial, sans-serif;vertical-align: top;">
                <b>Reporte Global de Documentos Pendientes de Acción</b>
            </samp>
        </div>
        <!--  DataTable Reporte Global de Documentos Pendientes de Acción  -->
        <table cellpadding="0" cellspacing="0" border="0" class="table table-bordered" id="DataGDP" style="font-size: 13px">
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Sexo</th>
                    <th>C. Ges</th>
                    <th>F. Nac (DD/MM/YYYY)</th>
                    <th>U. Venta (DD/MM/YYYY)</th>
                    <th>Edad</th>
                    <th>Patología</th>
                    <th>Estado</th>
                    <th>Documentación</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>

    <div class="row col-sm-12 col-xs-12">&nbsp;</div>

    <div class="row col-sm-12 col-xs-12 box3">
        <div class="col-sm-8 col-xs-8 text-left">
            <samp style="font-family: 'Ubuntu Condense', Helvetica, Arial, sans-serif;vertical-align: top;">
                <b>Pacientes Pendiente de Activarse [hasta 90 dias]</b>
            </samp>
        </div>
        <!--  DataTable Pacientes Pendiente de Activarse [hasta 90 dias]  -->
        <table cellpadding="0" cellspacing="0" border="0" class="table table-bordered" id="DataPPA" style="font-size: 13px">
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Sexo</th>
                    <th>C. Ges</th>
                    <th>F. Nac (DD/MM/YYYY)</th>
                    <th>Patologia</th>
                    <th>Estado</th>
                    <th>Documentación</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>

    <!--  PopUP de Pacientes  -->
    <div id="win" class="easyui-window" style="height: 1000px; top: 50px;"  data-options="modal:true, closed:true, minimizable:false, title:'Ver Historial', closeOnEscape: true, maximized:true, inline:true">
        <iframe src="" id="win_list" marginheight="0" marginwidth="0" scrolling="yes" noresize frameborder="0" style="width: 100%;height: 99%;"></iframe>
    </div>

    <?php
    include "../resources/Includes/BootstrapHTML5.php";
    include "../resources/Includes/EasyUI.php";
    include "../resources/Includes/DataTables.php";
    ?>

    <!-- Custom JS -->
    <script type="text/javascript" language="javascript" src="../resources/JS/Develop/panel.js"></script> -->
       <!--  <script type="text/javascript" language="javascript" src="../resources/JS/panel.min.js"></script>
       <!--     ########################### -->
   </body>
   </html>

   <?php
   function l_stringSexo($sex){
    switch ($sex) {
        case 'M':
        return  "Masculino";
        break;
        case 'F':
        return  "Femenino";
        break;

        default:
        return  "N/A";
        break;
    }
}

/*function str_docus($docs){
    // Consentimiento;Consentimiento_1231_29_9_2011_1424_martin irene consent.JPG ,Tarjeta; Tarjeta_1231_29_9_2011_1424_martin irene tarjeta.JPG
    $salida = "";

    if (strpos($docs, ',')){
        $splitDocs = explode(',', $docs);
        foreach($splitDocs as $docus){
            if (strpos($docus, ';')) {
                $splitDocus = explode(';', $docus);
                $type = $splitDocus[0];
                $ext = strtolower(pathinfo($splitDocus[1], PATHINFO_EXTENSION));;
                $file = $splitDocus[1];

                $salida .= "<li class=\"btn btn-sm btn-default\" style='cursor:pointer;' onclick = \"openfile('$file')\" title=\"$type\"><span class=\"TBL TBL-file_extension_$ext\"></span></li>";
            }
        }
    } else if (strpos($docs, ';')) {
        $splitDocus = explode(';', $docs);
        $type = $splitDocus[0];
        $ext = strtolower(pathinfo($splitDocus[1], PATHINFO_EXTENSION));;
        $file = $splitDocus[1];

        $salida .= "<li class=\"btn btn-sm btn-default\" style='cursor:pointer;' onclick = \"openfile('$file')\" title=\"$type\"><span class=\"TBL TBL-file_extension_$ext\" style='cursor:pointer;'></span></li>";
    }
    return $salida;
}
*/

function l_str_docus($docs){
    // Consentimiento;Consentimiento_1231_29_9_2011_1424_martin irene consent.JPG ,Tarjeta; Tarjeta_1231_29_9_2011_1424_martin irene tarjeta.JPG
    $salida = "";

    print_r($docs);

    if (strpos($docs, ',')){
        $splitDocs = explode(',', $docs);
        foreach($splitDocs as $docus){
            if (strpos($docus, ';')) {
                $splitDocus = explode(';', $docus);
                $type = $splitDocus[0];
                $ext = strtolower(pathinfo($splitDocus[1], PATHINFO_EXTENSION));;
                $file = urlencode($splitDocus[1]);

                $salida .= "<li class=\"btn btn-sm btn-default\" style='cursor:pointer;' onclick = \"openfile('$file')\" title=\"$type\"><span class=\"TBL TBL-file_extension_$ext\"></span></li>";
            }
        }
    } else if (strpos($docs, ';')) {
        $splitDocus = explode(';', $docs);
        $type = $splitDocus[0];
        $ext = strtolower(pathinfo($splitDocus[1], PATHINFO_EXTENSION));;
        $file = urlencode($splitDocus[1]);

        $salida .= "<li class=\"btn btn-sm btn-default\" style='cursor:pointer;' onclick = \"openfile('$file')\" title=\"$type\"><span class=\"TBL TBL-file_extension_$ext\" onclick = \"openfile('$file')\"></span></li>";
    } 
    return $salida;
}
?>
?>
