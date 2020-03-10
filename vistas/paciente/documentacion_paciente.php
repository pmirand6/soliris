<?php


            free_all_results($db);

            if(isset($id) AND $id != "") {

                echo "<div class='form-group'>
                <fieldset>
                <legend>Documentación <i id=\"editDocs\" class='fa fa-edit' title='Editar Documentación' style='cursor:pointer;'></i>
                <i id=\"histDocs\" class='fa fa-history' title='Historial de Documentación' style='cursor:pointer;'></i></legend>
                ";
                // Listo todos los documentos que esten activos para el paciente
                $sql = "CALL `ST_LIST_DOCS_ACTIVOS_PAC`('$id')";
                
                $resultdoc = mysqli_query($db, $sql);
                


                while ($doc = mysqli_fetch_assoc($resultdoc)) {
                    $extension = "";
                    $tipo = "";
                    $documento = "";

                    $documento = urlencode($doc["documento"]);
                    $extension = strtolower(pathinfo($doc["documento"], PATHINFO_EXTENSION));
                    $tipo = $doc["tipo"];


                    echo "
                    <div class=\"col-sm-4 col-xs-4\" onclick = \"openfile('$documento')\"  
                    style='cursor:pointer;'>
                    <ul>
                    <li class=\"li\">
                    <span class=\"file_extension _$extension\" title=\"$tipo\"></span>
                    <b>$tipo</b>
                    </li>
                    </ul>
                    </div>
                    ";
            };
            mysqli_free_result($resultdoc);

            echo "
            </fieldset>
            </div>
            ";
        }
        ?>
