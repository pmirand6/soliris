<?php 
    
    require_once("../config/config.php");
    include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
    
    

    $SQL = "SELECT * FROM apm ORDER BY nombre DESC;";
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



        /*<table cellpadding="0" cellspacing="0" border="0" class="table table-bordered" id="TBLAPM" style="font-size: 13px">
            <thead>
                <tr>
                    <th> id </th>
                    <th> Nombre </th>
                    <th> Estado </th>
                    <th> Acciones </th>
                </tr>
            </thead>
            <tbody>';
    while ($row = mysqli_fetch_assoc($result)) {
        $arr_tbody .= "<tr class=\"TBLrows\">";
        $arr_tbody .= '<td>' . $row["id"] . '</td>';
        $arr_tbody .= '<td><b class="pointer" onclick="callAPM(\'' . $row["id"] . '\')">' . ucwords(strtolower($row["nombre"])) . '</b></td>';
        $arr_tbody .= '<td>' . $row["estado"] . '</td>';
        $arr_tbody .= '<td><span class="pointer TBL TBL-Baja" title="Desactivar" onclick="delAPM(\'' . $row["id"] . '\')"></span></td>';
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
?>
*/