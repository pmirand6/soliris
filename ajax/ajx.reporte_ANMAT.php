<?php

require_once("../config/config.php");
include $_SERVER['DOCUMENT_ROOT'] . _BD;
include '../resources/PHP/PHPExcel_1.8.0/PHPExcel.php';
if (!empty($_GET["ini"]) and !empty($_GET["fin"])) {

    /**
     *  Formateo de fechas recibidas
     */
    $ini = date_format(date_create_from_format('d-m-Y', mysqli_real_escape_string($db, strtoupper($_GET["ini"]))), 'Y-m-d');
    $fin = date_format(date_create_from_format('d-m-Y', mysqli_real_escape_string($db, strtoupper($_GET["fin"]))), 'Y-m-d');

    // Se crea el objeto PHPExcel
    $objPHPExcel = new PHPExcel();

    // Se asignan las propiedades del libro
    $objPHPExcel->getProperties()->setCreator("Raffo"); // Nombre del autor

    // Se combinan las celdas A1 hasta B1, para colocar ahí el titulo del reporte
    $objPHPExcel->setActiveSheetIndex(0)
        ->mergeCells('A1:B1') // Titulo del reporte
        ->mergeCells('A2:B2') // Salto de linea
        ->mergeCells('A3:B3') // Salto de linea
        ->mergeCells('A4:B4') // Titulo Cantidad de Pacientes
        ->mergeCells('A5:B5') // Data de Cantidad de Pacientes
        ->mergeCells('A6:B6') // Salto de linea
        ->mergeCells('A7:B7') // Salto de linea
        ->mergeCells('A8:B8') // Salto de linea
        ->mergeCells('A9:B9') // Titulo Cantidad de Unidades vendidas en el Periodo
        ->mergeCells('A10:A10') // Subtitulo de Dosis y Cantidades
        ->mergeCells('A11:A11') // Data de Dosis y Cantidad
        ->mergeCells('A12:A12') // Totales
        ->mergeCells('A13:B13') // Salto de linea
        ->mergeCells('A14:B14') // Salto de linea
        ->mergeCells('A15:B15') // Titulo de Distribución de Pacientes por patología
        ->mergeCells('A16:A16') // Subtitulos de Patologias
        ->mergeCells('A17:A17'); // Comienzo de data de patologias
    // Se agregan los titulos del reporte
    $objPHPExcel->setActiveSheetIndex(0)
        ->setCellValue('A1', "Reporte Semestral -ANMAT- (Periodo: " . convertDate($ini) . " al " . convertDate($fin) . ")") // Titulo del reporte
        ->setCellValue('A4', 'Cantidad de Pacientes')  //Titulo de las secciones
        ->setCellValue('A9', 'Cantidad de Unidades vendidas en el Periodo')
        ->setCellValue('A10', 'Dosis')
        ->setCellValue('B10', 'Cantidad')
        ->setCellValue('A11', '300 mg.')
        ->setCellValue('A12', 'Total.')
        ->setCellValue('A15', 'Distribución de Pacientes por patología')
        ->setCellValue('A16', 'Patología')
        ->setCellValue('B16', 'Cantidad');


    // ESTILOS

    $estiloTituloReporte = array(
        'font' => array(
            'name'      => 'Verdana',
            'bold'      => true,
            'italic'    => false,
            'strike'    => false,
            'size'      => 12,
            'color'     => array(
                'rgb'       => '000000'
            )
        ),
        'fill' => array(
            'type'  => PHPExcel_Style_Fill::FILL_SOLID,
            'color' => array(
                'argb' => 'ABD0FF'
            )
        ),
        'alignment' => array(
            'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
            'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER,
            'rotation' => 0,
            'wrap' => TRUE
        )
    );

    $estiloTitulo1 = array(
        'font' => array(
            'name'      => 'Verdana',
            'bold'      => true,
            'italic'    => false,
            'strike'    => false,
            'size'      => 11,
            'color'     => array(
                'rgb'       => '000000'
            )
        ),
        'fill' => array(
            'type'  => PHPExcel_Style_Fill::FILL_SOLID,
            'color' => array(
                'argb' => 'ACFFD4'
            )
        ),
        'alignment' => array(
            'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
            'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER,
            'rotation' => 0,
            'wrap' => TRUE
        )
    );
    $estiloTitulo2 = array(
        'font' => array(
            'name'      => 'Verdana',
            'bold'      => true,
            'italic'    => false,
            'strike'    => false,
            'size'      => 11,
            'color'     => array(
                'rgb'       => '000000'
            )
        ),
        'fill' => array(
            'type'  => PHPExcel_Style_Fill::FILL_SOLID,
            'color' => array(
                'argb' => 'B6FFE3'
            )
        ),
        'alignment' => array(
            'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
            'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER,
            'rotation' => 0,
            'wrap' => TRUE
        )
    );
    $estiloTitulo3 = array(
        'font' => array(
            'name'      => 'Verdana',
            'bold'      => true,
            'italic'    => false,
            'strike'    => false,
            'size'      => 11,
            'color'     => array(
                'rgb'       => '000000'
            )
        ),
        'fill' => array(
            'type'  => PHPExcel_Style_Fill::FILL_SOLID,
            'color' => array(
                'argb' => '9CE5C0'
            )
        ),
        'alignment' => array(
            'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
            'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER,
            'rotation' => 0,
            'wrap' => TRUE
        )
    );
    $estiloTitulo4 = array(
        'font' => array(
            'name'      => 'Verdana',
            'bold'      => true,
            'italic'    => false,
            'strike'    => false,
            'size'      => 11,
            'color'     => array(
                'rgb'       => '000000'
            )
        ),
        'fill' => array(
            'type'  => PHPExcel_Style_Fill::FILL_SOLID,
            'color' => array(
                'argb' => '82BFA0'
            )
        ),
        'alignment' => array(
            'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
            'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER,
            'rotation' => 0,
            'wrap' => TRUE
        )
    );
    $estiloTitulo5 = array(
        'font' => array(
            'name'      => 'Verdana',
            'bold'      => true,
            'italic'    => false,
            'strike'    => false,
            'size'      => 11,
            'color'     => array(
                'rgb'       => '000000'
            )
        ),
        'fill' => array(
            'type'  => PHPExcel_Style_Fill::FILL_SOLID,
            'color' => array(
                'argb' => 'FFF5B9'
            )
        ),
        'alignment' => array(
            'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
            'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER,
            'rotation' => 0,
            'wrap' => TRUE
        )
    );
    $estiloTitulo6 = array(
        'font' => array(
            'name'      => 'Verdana',
            'bold'      => true,
            'italic'    => false,
            'strike'    => false,
            'size'      => 11,
            'color'     => array(
                'rgb'       => '000000'
            )
        ),
        'fill' => array(
            'type'  => PHPExcel_Style_Fill::FILL_SOLID,
            'color' => array(
                'argb' => 'D0D7FF'
            )
        ),
        'alignment' => array(
            'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
            'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER,
            'rotation' => 0,
            'wrap' => TRUE
        )
    );
    $estiloSubTitData = array(
        'font' => array(
            'name'      => 'Verdana',
            'bold'      => true,
            'italic'    => false,
            'strike'    => false,
            'size'      => 11,
            'color'     => array(
                'rgb'       => '000000'
            )
        ),
        'alignment' => array(
            'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
            'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER,
            'rotation' => 0,
            'wrap' => TRUE
        )
    );
    $estiloData = array(
        'font' => array(
            'name'      => 'Verdana',
            'bold'      => false,
            'italic'    => false,
            'strike'    => false,
            'size'      => 11,
            'color'     => array(
                'rgb'       => '000000'
            )
        ),
        'alignment' => array(
            'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
            'vertical' => PHPExcel_Style_Alignment::VERTICAL_CENTER,
            'rotation' => 0,
            'wrap' => TRUE
        )
    );

    // HEADERS
    $objPHPExcel->getActiveSheet()->getStyle('A1:B1')->applyFromArray($estiloTituloReporte);
    $objPHPExcel->getActiveSheet()->getStyle('A4:B4')->applyFromArray($estiloTitulo1);
    $objPHPExcel->getActiveSheet()->getStyle('A9:B9')->applyFromArray($estiloTitulo5);
    $objPHPExcel->getActiveSheet()->getStyle('A10:B10')->applyFromArray($estiloTitulo5);
    $objPHPExcel->getActiveSheet()->getStyle('A15:B15')->applyFromArray($estiloTitulo6);
    $objPHPExcel->getActiveSheet()->getStyle('A16:B16')->applyFromArray($estiloTitulo6);
    // DATA
    $objPHPExcel->getActiveSheet()->getStyle('A5:B5')->applyFromArray($estiloData);
    $objPHPExcel->getActiveSheet()->getStyle('A11:A12')->applyFromArray($estiloSubTitData);
    $objPHPExcel->getActiveSheet()->getStyle('B11:B12')->applyFromArray($estiloData);
    $objPHPExcel->getActiveSheet()->getStyle('A17:A40')->applyFromArray($estiloSubTitData);
    $objPHPExcel->getActiveSheet()->getStyle('B17:B40')->applyFromArray($estiloData);

    // ################# FIN ESTILOS ################

    // Se autoajusta el ancho de las celdas
    $objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('A')->setWidth(50);
    $objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('B')->setWidth(50);


    // Se asigna el nombre a la hoja
    $objPHPExcel->getActiveSheet()->setTitle('FV_ANMAT-Semestral');

    // Se activa la hoja para que sea la que se muestre cuando el archivo se abre
    $objPHPExcel->setActiveSheetIndex(0);


    // VARIABLES
    // Contador de Pacientes con ventas en NP


    $SQL1 = "SELECT count(distinct(paciente_id)) as CantPacientes FROM maestro_ventas WHERE estado_id = 23 AND fecha_venta BETWEEN '$ini' AND '$fin';";


    //Cantidad de ventas

    $SQL5 = "SELECT
          COUNT(*) AS Cant
        FROM maestro_ventas
        WHERE presentacion_id = 27
        AND estado_id = 23
        AND fecha_venta BETWEEN '$ini' AND '$fin';"; //null


    $SubTotPac = getData('CantPacientes', $SQL1, '', 9);

    $objPHPExcel->setActiveSheetIndex(0)
        ->setCellValue('A5', getData('CantPacientes', $SQL1, '', 9))
        ->setCellValue('B11', getData('Cant', $SQL5, '', 9))
        ->setCellValue('B12', getData('Cant', $SQL5, '', 9));

    $num = 17;

    $sqlVentasPatologia = "SELECT
          COUNT(DISTINCT (p.id)) AS cantVentasPat,
          p.patologia_id,
          (SELECT pat.patologia_nombre FROM patologia pat WHERE pat.id = p.patologia_id) AS patNombre
        FROM paciente p
          INNER JOIN maestro_ventas mv ON mv.paciente_id = p.id
          WHERE mv.estado_id = 23
          AND mv.fecha_venta BETWEEN '$ini' AND '$fin'
        GROUP BY p.patologia_id";


    $resultPats = mysqli_query($db, $sqlVentasPatologia);

    while ($rowPat = mysqli_fetch_assoc($resultPats)){
        //Seteo de celda de Nombre de Patologia
        $objPHPExcel->setActiveSheetIndex(0)->setCellValue('A' . $num, $rowPat["patNombre"]);
        //Seteo de celda de Cantidad de ventas de Patologia
        $objPHPExcel->setActiveSheetIndex(0)->setCellValue('B' . $num, $rowPat["cantVentasPat"]);

        $num = $num + 1;
    }

    mysqli_free_result($resultPats);


    // FIN VARIABLES


    // Se manda el archivo al navegador web, con el nombre que se indica (Excel2007)
    header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
    header('Content-Disposition: attachment;filename="ReporteANMAT.xlsx"');
    header('Cache-Control: max-age=0');

    $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
    $objWriter->save('php://output');
    exit;
} else {
    print_r('No hay resultados para mostrar');
}
?>

    <?php

    /** Retorna los datos para armar el excel */
    function getData($fieldName, $SQL, $TotPac, $responseType)
    {


        require_once('../config/config.php');
        include $_SERVER['DOCUMENT_ROOT'] . _BD;




        $result = mysqli_query($db, $SQL);



        $response = "";
        while ($row = mysqli_fetch_assoc($result)) {
            switch ($responseType) {
                case 0:
                    $field = $row[$fieldName];
                    $parcial = $field * 100  / $TotPac;
                    $response = $field . " - " . number_format($parcial, 0) . "%";
                    break;
                case 1:
                    $field = $row[$fieldName];
                    $response = number_format($field / 21, 0);
                    break;
                case 9:
                    $field = $row[$fieldName];
                    $response = number_format($field, 0);
                    break;
            }
        };
        mysqli_free_result($result);

        return $response;
    }

    /** Funcion para obtener los meses
     * @param $value (número del mes)
     */
    function convertDate($value)
    {
        $mons = array(1 => "Ene", 2 => "Feb", 3 => "Mar", 4 => "Abr", 5 => "May", 6 => "Jun", 7 => "Jul", 8 => "Ago", 9 => "Sep", 10 => "Oct", 11 => "Nov", 12 => "Dec");

        $DateVal = explode("-", $value);
        return $DateVal[2] . "/" . $mons[intval($DateVal[1])] . "/" . $DateVal[0];
    }
    ?>
