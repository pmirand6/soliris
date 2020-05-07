<?php


            free_all_results($db);

            if(isset($id) AND $id != "") {
                //FIXME revisar harcode
                
                if ($_SESSION["grupo"] == 'atencion_paciente') {
                    l_docs($id, $db);
                } else {
                    l_docs_fv($id, $db);
                }

                
        }



        function l_docs_fv($id, $db)
        {
            echo '<table class="table">
            <thead>
              <tr>
                <th>Tipo</th>
                <th>Fecha Documento</th>
                <th>Expira</th>
                <th>Documento</th>
              </tr>
            </thead>
            <tbody>
            ';
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
                <tr>
                    <td>
                        {$tipo}
                    </td>
                    <td>
                        {$doc['fecha_documento']}
                    </td>
                    <td>
                        {$doc['expira']}
                    </td>
                    <td>
                        <div class=\"col-sm-6 col-xs-6\" 
                        onclick=\"openFile('{$documento}')\" style=\"cursor:pointer;\">
                        <span class=\"file_extension _{$extension}\"></span>
                    </td>
                </tr>
                
                ";
        };
        mysqli_free_result($resultdoc);
              
            echo '</tbody>
          </table>';
        }

        function l_docs($id, $db)
        {
            echo "
                <form class='form-horizontal form' autocomplete='off' id='frm-documentacion'>
                    <fieldset class='form-horizontal col-sm-offset-1 col-xs-offset-1 col-sm-10 col-xs-10'>
                        <legend>Documentación 
                            <i id=\"editDocs\" class='fa fa-edit' title='Editar Documentación' style='cursor:pointer;'></i>
                            <i id=\"histDocs\" class='fa fa-history' title='Historial de Documentación' style='cursor:pointer;'></i>
                        </legend>
                        <div class='container'>
                        <div class='row'>
                ";
                echo '<table class="table">
                        <thead>
                        <tr>
                            <th>Tipo</th>
                            <th>Fecha Documento</th>
                            <th>Expira</th>
                            <th>Documento</th>
                        </tr>
                        </thead>
                        <tbody>
                        ';
                        
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
                    <tr>
                        <td>
                            {$tipo}
                        </td>
                        <td>
                            {$doc['fecha_documento']}
                        </td>
                        <td>
                            {$doc['expira']}
                        </td>
                        <td>
                            <div class=\"col-sm-6 col-xs-6\" 
                            onclick=\"openFile('{$documento}')\" style=\"cursor:pointer;\">
                            <span class=\"file_extension _{$extension}\"></span>
                        </td>
                    </tr>
                    
                    ";
            };
            mysqli_free_result($resultdoc);
                  
                echo '</tbody>
              </table>
                </fieldset>
            </form>'
            ;
            
        }
?>
