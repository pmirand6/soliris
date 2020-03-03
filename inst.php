<?php
    
require_once('config/config.php');
    include_once $_SERVER['DOCUMENT_ROOT'] . _BD;
    include_once $_SERVER['DOCUMENT_ROOT'] . _FN;
?>
<select id="institucion" name="institucion" class="form-control selectpicker">
                       <option></option>
                       <?php
                       $SQL = "SELECT nombre, id FROM institucion WHERE estado = 'Activo' ORDER BY nombre ASC";

                       $result = mysqli_query($db, $SQL);
                       $str_select = '';
                       while ($row = mysqli_fetch_assoc($result)) {
                        $id = $row["id"];
                        $opt_instituciones = ucwords(strtolower($row["nombre"]));

                        if (strcmp($last_institucion, $opt_instituciones) == 0){
                            $str_select .= "<option value=\"$id\" selected>$opt_instituciones</option>";
                        }else{
                            $str_select .= "<option value=\"$id\">$opt_instituciones</option>";
                        }
                    };
                    echo $str_select;
                    mysqli_free_result($result);
                                        //LIMITE DE 200 RESULTADOS
                    ?>
                </select>