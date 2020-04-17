<?php

require_once("../config/config.php");
include $_SERVER['DOCUMENT_ROOT'] . _BD;
include '../resources/PHP/PHPExcel_1.8.0/PHPExcel.php';
if (!empty($_GET["ini"]) and !empty($_GET["fin"])) {
    $ini = $_GET["ini"];
    $fin = $_GET["fin"];

    // Se crea el objeto PHPExcel
    $objPHPExcel = new PHPExcel();

    // Se asignan las propiedades del libro
    $objPHPExcel->getProperties()->setCreator("Raffo"); // Nombre del autor

    // Se combinan las celdas A1 hasta D1, para colocar ahí el titulo del reporte
    $objPHPExcel->setActiveSheetIndex(0)
        ->mergeCells('A1:B1')
        ->mergeCells('A2:B2')
        ->mergeCells('A3:B3')
        ->mergeCells('A4:B4')
        ->mergeCells('A5:B5')
        ->mergeCells('A6:B6')
        ->mergeCells('A7:B7')
        ->mergeCells('A8:B8')
        ->mergeCells('A9:B9')
        ->mergeCells('A10:B10')
        ->mergeCells('A11:B11')
        ->mergeCells('A12:B12')
        ->mergeCells('A13:B13')
        ->mergeCells('A14:B14')
        ->mergeCells('A21:B21')
        ->mergeCells('A22:B22')
        ->mergeCells('A23:B23');
    // Se agregan los titulos del reporte
    $objPHPExcel->setActiveSheetIndex(0)
        ->setCellValue('A1', "Reporte Semestral -ANMAT- (Periodo: " . convertDate($ini) . " al " . convertDate($fin) . ")") // Titulo del reporte
        ->setCellValue('A4', 'Cantidad de Pacientes')  //Titulo de las secciones
        ->setCellValue('A6', 'Cantidad de Pacientes (Hombres)')
        ->setCellValue('A8', 'Cantidad de Pacientes (Mujeres Sin Capacidad de Gestar)')
        ->setCellValue('A10', 'Cantidad de Pacientes (Mujeres Con Capacidad de Gestar)')
        ->setCellValue('A14', 'Cantidad de Unidades vendidas en el Periodo')
        ->setCellValue('A15', 'Dosis')
        ->setCellValue('B15', 'Cantidad')
        ->setCellValue('A16', '4mg.')
        ->setCellValue('A17', '3mg.')
        ->setCellValue('A18', '2mg.')
        ->setCellValue('A19', '1mg.')
        ->setCellValue('A20', 'Total.')
        ->setCellValue('A23', 'Distribución de Pacientes por patología')
        ->setCellValue('A24', 'Patología')
        ->setCellValue('B24', 'Cantidad');


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
    $objPHPExcel->getActiveSheet()->getStyle('A6:B6')->applyFromArray($estiloTitulo2);
    $objPHPExcel->getActiveSheet()->getStyle('A8:B8')->applyFromArray($estiloTitulo3);
    $objPHPExcel->getActiveSheet()->getStyle('A10:B10')->applyFromArray($estiloTitulo4);
    $objPHPExcel->getActiveSheet()->getStyle('A14:B14')->applyFromArray($estiloTitulo5);
    $objPHPExcel->getActiveSheet()->getStyle('A15:B15')->applyFromArray($estiloTitulo5);
    $objPHPExcel->getActiveSheet()->getStyle('A23:B23')->applyFromArray($estiloTitulo6);
    $objPHPExcel->getActiveSheet()->getStyle('A24:B24')->applyFromArray($estiloTitulo6);
    // DATA
    $objPHPExcel->getActiveSheet()->getStyle('A5:B5')->applyFromArray($estiloData);
    $objPHPExcel->getActiveSheet()->getStyle('A7:B7')->applyFromArray($estiloData);
    $objPHPExcel->getActiveSheet()->getStyle('A9:B9')->applyFromArray($estiloData);
    $objPHPExcel->getActiveSheet()->getStyle('A11:B11')->applyFromArray($estiloData);
    $objPHPExcel->getActiveSheet()->getStyle('A16:A20')->applyFromArray($estiloSubTitData);
    $objPHPExcel->getActiveSheet()->getStyle('B16:B20')->applyFromArray($estiloData);
    $objPHPExcel->getActiveSheet()->getStyle('A25:A40')->applyFromArray($estiloSubTitData);
    $objPHPExcel->getActiveSheet()->getStyle('B25:B40')->applyFromArray($estiloData);

    // ################# FIN ESTILOS ################

    // Se autoajusta el ancho de las celdas
    $objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('A')->setWidth(50);
    $objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('B')->setWidth(50);


    // Se asigna el nombre a la hoja
    $objPHPExcel->getActiveSheet()->setTitle('FV_ANMAT-Semestral');

    // Se activa la hoja para que sea la que se muestre cuando el archivo se abre
    $objPHPExcel->setActiveSheetIndex(0);


    // VARIABLES

    $SQL1 = "SELECT count(distinct(nombre)) as CantPacientes FROM soliris_maestro WHERE estado='NP' AND fecha_venta BETWEEN '$ini' AND '$fin';";
    $SQL2 = "SELECT count(distinct(nombre)) as CantMasculinos FROM soliris_maestro WHERE sexo='M' AND estado='NP' AND fecha_venta BETWEEN '$ini' AND '$fin';";
    $SQL3 = "SELECT count(distinct(RM.nombre)) as CantFemeninosSG FROM soliris_maestro as RM LEFT JOIN pacientes as P ON(RM.nombre=P.id) WHERE RM.sexo='F' AND RM.estado='NP' AND (P.c_gestar in ('NO') OR isnull(P.c_gestar)) AND RM.fecha_venta BETWEEN '$ini' AND '$fin';";
    $SQL4 = "SELECT count(distinct(RM.nombre)) as CantFemeninosCG FROM soliris_maestro as RM LEFT JOIN pacientes as P ON(RM.nombre=P.id) WHERE RM.sexo='F' AND RM.estado='NP' AND P.c_gestar in ('SI') AND RM.fecha_venta BETWEEN '$ini' AND '$fin';";

    //CONTEO DE UNIDADES

    $SQL5 = "SELECT COUNT(*) as Cant4 FROM soliris_maestro WHERE LEFT(dosis, 2) = '4' AND estado='NP' AND fecha_venta BETWEEN '$ini' AND '$fin';"; //null
    $SQL6 = "SELECT COUNT(*) as Cant3 FROM soliris_maestro WHERE LEFT(dosis, 2) = '3' AND estado='NP' AND fecha_venta BETWEEN '$ini' AND '$fin';";
    $SQL7 = "SELECT COUNT(*) as Cant2 FROM soliris_maestro WHERE LEFT(dosis, 2) = '2' AND estado='NP' AND fecha_venta BETWEEN '$ini' AND '$fin';";
    $SQL8 = "SELECT COUNT(*) as Cant1 FROM soliris_maestro WHERE LEFT(dosis, 2) = '1' AND estado='NP' AND fecha_venta BETWEEN '$ini' AND '$fin';";
    $SQL9 = "SELECT COUNT(*) as CantUni FROM soliris_maestro WHERE estado='NP' AND fecha_venta BETWEEN '$ini' AND '$fin';";


    // SE CORRIGEN LAS DOSIS DE soliris Y SE CAMBIA POR COUNT
    /*$SQL5 = "SELECT SUM(unidades) as Cant25 FROM soliris_maestro WHERE LEFT(dosis, 2) = '25' AND estado='NP' AND fecha_venta BETWEEN '$ini' AND '$fin';";//null
        $SQL6 = "SELECT SUM(unidades) as Cant15 FROM soliris_maestro WHERE LEFT(dosis, 2) = '15' AND estado='NP' AND fecha_venta BETWEEN '$ini' AND '$fin';";
        $SQL7 = "SELECT SUM(unidades) as Cant10 FROM soliris_maestro WHERE LEFT(dosis, 2) = '10' AND estado='NP' AND fecha_venta BETWEEN '$ini' AND '$fin';";
        $SQL8 = "SELECT SUM(unidades) as Cant5 FROM soliris_maestro WHERE LEFT(dosis, 1) = '5' AND estado='NP' AND fecha_venta BETWEEN '$ini' AND '$fin';";
        $SQL9 = "SELECT SUM(unidades) as CantUni FROM soliris_maestro WHERE estado='NP' AND fecha_venta BETWEEN '$ini' AND '$fin';";*/


    $SubTotPac = getData('CantPacientes', $SQL1, '', 9);

    $objPHPExcel->setActiveSheetIndex(0)
        ->setCellValue('A5', getData('CantPacientes', $SQL1, '', 9))
        ->setCellValue('A7', getData('CantMasculinos', $SQL2, $SubTotPac, 0))
        ->setCellValue('A9', getData('CantFemeninosSG', $SQL3, $SubTotPac, 0))
        ->setCellValue('A11', getData('CantFemeninosCG', $SQL4, $SubTotPac, 0))
        ->setCellValue('B16', getData('Cant4', $SQL5, '', 9))
        ->setCellValue('B17', getData('Cant3', $SQL6, '', 9))
        ->setCellValue('B18', getData('Cant2', $SQL7, '', 9))
        ->setCellValue('B19', getData('Cant1', $SQL8, '', 9))
        ->setCellValue('B20', getData('CantUni', $SQL9, '', 9));


    // PGM- SE COMENTA ESTA LINEA Y SE MODIFICA EL ÚLTIMO PARÁMETRO POR 9 PARA QUE LA FUNCION
    // getData no lo divida por 21 //
    /*
        ->setCellValue('B16', getData('Cant4', $SQL5, '', 1))
        ->setCellValue('B17', getData('Cant3', $SQL6, '', 1))
        ->setCellValue('B18', getData('Cant1', $SQL7, '', 1))
        ->setCellValue('B19', getData('CantUni', $SQL8, '', 1))*/


    $num = 25;

    // $SQL10 = "SELECT valor FROM auxiliar WHERE tipo='patologia';";
    $SQL10 = "SELECT count(*) as CANT, patologia as valor FROM soliris_maestro WHERE estado='NP' AND fecha_venta BETWEEN '$ini' AND '$fin' GROUP BY patologia ORDER BY CANT DESC;";
    $resultPats = mysqli_query($db, $SQL10);
    while ($rowPats = mysqli_fetch_assoc($resultPats)) {
        $patologia = $rowPats["valor"];

        $SQL10_1 = "SELECT count(distinct(nombre)) as Cantidad FROM soliris_maestro WHERE patologia='$patologia' AND estado='NP' AND fecha_venta BETWEEN '$ini' AND '$fin' ORDER BY Cantidad DESC;";
        $resultPatsVal = mysqli_query($db, $SQL10_1);
        while ($rowPatsVal = mysqli_fetch_assoc($resultPatsVal)) {
            $patologiaValor = $rowPatsVal["Cantidad"];

            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('A' . $num, $patologia);
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('B' . $num, $patologiaValor);
        };
        mysqli_free_result($resultPatsVal);
        $num = $num + 1;
    };
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
    function convertDate($value)
    {
        $mons = array(1 => "Ene", 2 => "Feb", 3 => "Mar", 4 => "Abr", 5 => "May", 6 => "Jun", 7 => "Jul", 8 => "Ago", 9 => "Sep", 10 => "Oct", 11 => "Nov", 12 => "Dec");

        $DateVal = explode("-", $value);
        return $DateVal[2] . "/" . $mons[intval($DateVal[1])] . "/" . $DateVal[0];
    }
    ?>
