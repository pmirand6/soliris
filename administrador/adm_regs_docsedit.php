<?php
    
    

require('../config/config.php');
    include $_SERVER['DOCUMENT_ROOT'] . _BD;
    include $_SERVER['DOCUMENT_ROOT'] . _SG;
    

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height">

    <title>Administrador de Registros</title>

    <style type="text/css">
        /* Latest compiled and minified CSS */
            @import "../resources/Bootstrap-3.3.1/css/bootstrap.min.css";
        /* Optional theme */
            @import "../resources/Bootstrap-3.3.1/css/bootstrap-theme.min.css";
        /* Font-Awesome */
            @import "../resources/CSS/Font-Awesome-4.5.0/css/font-awesome.min.css";
        /* File Upload */
            @import "../resources/JQuery-FileUpload/CSS/uploadfile.css";
        /* Custom CSS */
            @import "../resources/Sprites/file_extension.css";

        .form-horizontal .selectContainer .form-control-feedback {
            top: 0;
            right: 25px;
        }
        li{
            list-style-type: none;
            height: 48px;
            vertical-align: top;
        }
        li:hover{
            color: #e35919;
        }
    </style>

</head>
<body>
    <fieldset class="form-horizontal col-sm-offset-3 col-xs-offset-3 col-sm-6 col-xs-6">
	<form class="col-sm-12 col-xs-12 form" id="form_reg_edit">
        <legend>Documento seleccionado</legend>
        <input type="hidden" id="idreg" value="<?php echo $_GET["idreg"]?>">
        <input type="hidden" id="motivo" value="<?php echo $_GET["motivo"]?>">

<?php
            $id = $_GET["idreg"];
                $SQLdoc = " SELECT *
                    FROM soliris_documentacion a
                    WHERE a.id_maestro = '$id' AND a.tipo = 'Receta' AND referencia = 'soliris_maestro' AND a.id = (
                      SELECT MAX(b.id)
                      FROM soliris_documentacion b
                      WHERE b.id_maestro = a.id_maestro AND referencia = 'soliris_maestro' AND b.tipo = a.tipo
                    );";

                $resultdoc = mysqli_query($db, $SQLdoc);

                while ($doc = mysqli_fetch_assoc($resultdoc)) {
                  if (mysqli_num_rows($resultdoc) > 0) {
                    $extension = "";
                    $tipo = "";
                    $documento = "";

                    $documento = urlencode($doc["documento"]);
                    $extension = strtolower(pathinfo($doc["documento"], PATHINFO_EXTENSION));
                    $tipo = $doc["tipo"];
                    $fecha = $doc["fecha"];
					$numero= $doc["id"];


                    echo "
                        <div class=\"col-sm-12 col-xs-12\">
                            <ul>
                                <li class=\"li\">
									<input type=\"hidden\" name=\"numero\" id=\"numero\" value=\"$numero\">
                                    <span class=\"file_extension _$extension\" title=\"$tipo\" onclick = \"openfile('$documento')\" style='cursor:pointer;'></span>
                                    <b>$tipo - $fecha</b> <span class='fa fa-hand-o-right'></span> <div id=\"Receta\">Reemplazar</div>
                                </li>
                            </ul>
                        </div>";
                  } else {
                    echo "<div class=\"col-sm-12 col-xs-12\">
                      No hay documentos en el registro solicitado
                      </div>";

                  }
                }
                mysqli_free_result($resultdoc);
?>

                </tbody>
            </table>
			<br><br><br><br>
			<br><br><br><br>
            <hr>
            <!-- Button (Double) -->
            <div class="form-group text-center">
                <div class="col-sm-12">
                    <button type="submit" id="buscar" name="guardar" class="btn btn-success">
                        <span class="fa fa-save"></span>
                        Guardar
                    </button>
                </div>
            </div>

        </form>
    </fieldset>
<?php
    include "../resources/Includes/BootstrapHTML5.php";
?>
    <!-- JQuery FileUpload-->
        <script type="text/javascript" src="../resources/JQuery-FileUpload/JS/jquery.uploadfile.min.js"></script>
    <!-- Custom JS -->
       <script src="../resources/JS/Develop/adm_regs_docsedit.js"></script> 
<!--      <script type="text/javascript" src="../resources/JS/adm_regs_docsedit.min.js"></script>-->
<!-- ################## -->
</body>
</html>
<?php
    mysqli_close($db);
?>
