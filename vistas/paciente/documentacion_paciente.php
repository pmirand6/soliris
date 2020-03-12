<?php


            free_all_results($db);

            if(isset($id) AND $id != "") {

                echo "
                <form class='form-horizontal form' autocomplete='off' id='frm-dictamen'>
                    <fieldset class='form-horizontal col-sm-offset-1 col-xs-offset-1 col-sm-10 col-xs-10'>
                        <legend>Documentación 
                            <i id=\"editDocs\" class='fa fa-edit' title='Editar Documentación' style='cursor:pointer;'></i>
                            <i id=\"histDocs\" class='fa fa-history' title='Historial de Documentación' style='cursor:pointer;'></i>
                        </legend>
                        <div class='container'>
                        <div class='row'>
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
                  
                            <div class=\"col-sm-6 col-xs-6\" onclick = \"openfile('$documento')\" style='cursor:pointer;'>
                                        <span class=\"file_extension _$extension\" title=\"$tipo\"></span>
                                        <b>$tipo</b>
                                
                            </div>
                        
                    ";
            };
            mysqli_free_result($resultdoc);

            echo "
            </div>
                    </div>
            </fieldset>
            </form>
            ";
        }
        ?>
