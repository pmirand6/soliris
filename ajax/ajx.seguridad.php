<?php

    require_once('../config/config.php');
    include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
    

    //$SQL = "SELECT * FROM soliris_seguridad ORDER BY pagina ASC;";
    $SQL = "CALL `ST_LIST_SEGURIDAD`()";
    $result = mysqli_query($db, $SQL);

    $arr_tbody = array();

    while ($row = mysqli_fetch_assoc($result)) {
        $arr_row = array(
            "id" => $row["id"],
            "pagina" => $row["pagina"],
            "descripcion" => $row["descripcion"],
            "admin" => createBoton($row["roles"], 'admin', $row["id"]),
            "fv" => createBoton($row["roles"], 'fv', $row["id"]),
            "atencion_paciente" => createBoton($row["roles"],'atencion_paciente', $row["id"]),
            "marketing" => createBoton($row["roles"], 'marketing', $row["id"]),
            "ventas" => createBoton($row["roles"],'ventas', $row["id"]),
            "auditor" => createBoton($row["roles"],'auditor', $row["id"]),
            "apm" => createBoton($row["roles"],'apm', $row["id"]),
            
            "accion" => createBotonDel($row["id"])
        );
        array_push($arr_tbody, $arr_row);
    };

    mysqli_free_result($result);
    mysqli_close($db);

    echo "{\"aaData\": " . json_encode($arr_tbody) . "}";

    function createBoton($roles, $grupo, $idPagina){
        $array_roles = explode(',', $roles);
        $clave = in_array($grupo, $array_roles);
        if($clave){
            $valorGrupo = 1;
            return "<button type=\"button\" class=\"btn-contenido btn btn-default btn-xs " . setBotonActive($valorGrupo) . " \" onclick=\"setPermisos($idPagina, '$grupo', 0)\"></button><i style=\"display: none\">" . returnValueExcel($valorGrupo) . "</i>";
        } else {
            $valorGrupo = 0;
            return "<button type=\"button\" class=\"btn-contenido btn btn-default btn-xs " . setBotonActive($valorGrupo) . " \" onclick=\"setPermisos($idPagina, '$grupo', 1)\"></button><i style=\"display: none\">" . returnValueExcel($valorGrupo) . "</i>";
        }

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
