<?php 

    
    require_once("../config/config.php");
    include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
    
    

    $SQL = "SELECT * FROM institucion ORDER BY nombre;";
    $result = mysqli_query($db, $SQL);

    while($row = mysqli_fetch_assoc($result)) {
      //SE CREA EL ARRAY QUE VA A CONTENER LOS DATOS PARA EL JSON
        $var[] = $row;
    }
    
    //SALIDA DE JSON
    if (isset($var)&&(!empty($var))) {
        echo "{\"data\": " . json_encode($var) . "}";
    } else {
        echo "{\"data\": []}";
    }

  mysqli_free_result($result);
  mysqli_close($db);

/*
    $arr_tbody = '

    while ($row = mysqli_fetch_assoc($result)) {
        $arr_tbody .= "<tr class=\"TBLrows\">";
        $arr_tbody .= '<td>' . $row["id"] . '</td>';
        $arr_tbody .= '<td><b class="pointer" onclick="callInst(\'' . $row["id"] . '\')">' . ucwords(strtolower($row["nombre"])) . '</b></td>';
        $arr_tbody .= '<td>' . $row["direccion"] . '</td>';
        $arr_tbody .= '<td>' . $row["altura"] . '</td>';
        $arr_tbody .= '<td>' . $row["localidad"] . '</td>';
        $arr_tbody .= '<td>' . $row["provincia"] . '</td>';
        $arr_tbody .= '<td>' . $row["tipo"] . '</td>';
//      $arr_tbody .= '<td>' . $row["estado"] . '</td>';
        $arr_tbody .= "<td><div class=\"TBL TBL-" . str_replace(" ", "_", $row["estado"]) . "\" title=\"" . $row["estado"] . "\"><p class=\"hidden\">" . $row["estado"] . "</p></div></td>";
        $arr_tbody .= '<td>' . $row["familia"] . '</td>';
        $arr_tbody .= '<td><span class="pointer TBL TBL-Baja" title="Desactivar" onclick="delInst(\'' . $row["id"] . '\')"></span></td>';
        $arr_tbody .= '</tr>';
    };

    mysqli_free_result($result);
    mysqli_close($db);

    $arr_tbody .= "

            </tbody>
        </table>
    </body>
</html>";

    echo $arr_tbody;*/
?>
