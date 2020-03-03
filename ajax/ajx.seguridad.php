<?php

require_once('../config/config.php');
    include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
    

    $SQL = "SELECT * FROM soliris_seguridad ORDER BY pagina ASC;";
    $result = mysqli_query($db, $SQL);

    $arr_tbody = array();

    while ($row = mysqli_fetch_assoc($result)) {
        $arr_row = array(
            "id" => $row["id"],
            "pagina" => $row["pagina"],
            "descripcion" => $row["descripcion"],
            "admin" => createBoton($row["id"], 'admin', $row["admin"]),
            "fv" => createBoton($row["id"], 'fv', $row["fv"]),
            "marketing" => createBoton($row["id"], 'marketing', $row["marketing"]),
            "ventas" => createBoton($row["id"], 'ventas', $row["ventas"]),
            "auditor" => createBoton($row["id"], 'auditor', $row["auditor"]),
			"apm" => createBoton($row["id"], 'apm', $row["apm"]),
            "accion" => createBotonDel($row["id"])
        );
        array_push($arr_tbody, $arr_row);
    };

    mysqli_free_result($result);
    mysqli_close($db);

    echo "{\"aaData\": " . json_encode($arr_tbody) . "}";

    function createBoton($id, $grupo, $valorGrupo){
        return "<button type=\"button\" class=\"btn-contenido btn btn-default btn-xs " . setBotonActive($valorGrupo) . " \" onclick=\"setPermisos(this, '$id', '$grupo')\"></button><i style=\"display: none\">" . returnValueExcel($valorGrupo) . "</i>";
    }
    function createBotonDel($id){
        //return "<span class=\"pointer TBL TBL-Baja\" title=\"Eliminar\" onclick=\"delSeg('$id')\"></span>";
        return "<button type='button' class='del_pag btn btn-danger' title='Eliminar' style='margin-left: 13px;' onclick=\"delSeg('$id')\"><i class='fa fa-trash-o'></i></button>";
    }
    function setBotonActive($valor){
        if ($valor == '1'){
            return "btn-success active";
        } else {
            return "btn-default";
        }
    }
    function returnValueExcel($valorGrupo) {
        switch ($valorGrupo){
            case 1:
                return "Sí";
                break;
            default:
                return "No";
                break;
        }
    }
?>
