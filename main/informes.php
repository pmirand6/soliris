<?php

require('../config/config.php');
include $_SERVER['DOCUMENT_ROOT'] . _BD;
include $_SERVER['DOCUMENT_ROOT'] . _FN;
include $_SERVER['DOCUMENT_ROOT'] . _SG;



?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height">

  <title>Panel soliris</title>

  <style type="text/css">
    /* Latest compiled and minified CSS */
    @import "../resources/Bootstrap-3.3.1/css/bootstrap.min.css";
    /* Select2 CSS */
    @import "../resources/select2/dist/css/select2.min.css";
    /* Select2 CSS Bootstrap Theme*/
    @import "../resources/select2/dist/css/select2-bootstrap.css";
    /* Font-Awesome */
    @import "../resources/CSS/Font-Awesome-4.5.0/css/font-awesome.min.css";
    /* EasyUI */
    @import "../resources/JQuery-EasyUI-1.4.2/themes/bootstrap/easyui.css";
    /* Iconos de Estados */
    @import "../resources/Sprites/spriteListado.css";
   /* Style DataTables Bootstrap*/
   @import "../resources/DataTables/datatables.min.css";
    /* Custom CSS */
    @import "../resources/CSS/Develop/informes.css";
  </style>

</head>

<body>
  <br>
  <section id="titulo">
    <div class="text-center">
      <h4>Alta de Venta</h4>
      <h5>Por favor seleccione un paciente para realizar la venta</h5>
      <hr>
    </div>
  </section>

  <section>
    <form id="form-select" class="form-horizontal col-sm-offset-1 col-xs-offset-1 col-sm-10 col-xs-10 form">
      <!-- Form Name -->
      <div class="form-group col-sm-10 col-xs-10 text-center">
        <label class="col-sm-3 col-xs-3 control-label" for="paciente">Buscar por Paciente</label>
        <div class="col-sm-6 col-xs-6">
          <input type="hidden" name="pac" id="pac">
          <div class="input-group">
            <select id="paciente" name="paciente" class="form-control input-md"></select>
          </div>
        </div>
        <div class="col-sm-3 col-xs-3">
          <button type="submit" id="buscar" name="buscar" class="btn btn-info">
            <span class="fa fa-search"></span>
            Buscar
          </button>
          <i id="loading" class="fa fa-spinner fa-pulse"></i>
          <button type="button" id="new-search" name="new-search" class="btn btn-primary">
            Nueva Busqueda
          </button>
        </div>
      </div>
    </form>
  </section>
  <div class="form-group col-sm-11 col-xs-11" id="DTlist">
    <br>
    <fieldset>
      <legend class="LabelDTB">Datos del Paciente</legend>
      <!-- Se carga de un div externo a esta pagina -->
      <!--<div id="PacDat"></div>-->
      <table cellpadding="0" cellspacing="0" border="0" class="table table-bordered TBLrows" id="PacDat" style="font-size: 13px; width:100%;">
        <thead>
          <tr>
            <th> Paciente </th>
            <th> Sexo </th>
            <th> Edad </th>
            <th> F. Nac</th>
            <th> Patología </th>
            <th> Sub Patología </th>
            <th> F. Cons</th>
            <th> Estado </th>
            <th> Sub Estado </th>
          </tr>
        </thead>
        <tbody>
        </tbody>
      </table>
    </fieldset>
    <hr>
    <fieldset>
      <!-- Button -->
      <div class="form-group text-center">
        <div class="col-sm-12">
          <button type="submit" id="nueva_venta" name="nueva_venta" class="btn btn-success">
            <span class="fa fa-cart-plus"></span>
            Nueva Operación
          </button>
        </div>
      </div>

    </fieldset>
    <hr>
    <fieldset>
      <legend class="LabelDTB">Últimas Ventas</legend>
      <!-- Se carga de un div externo a esta pagina -->
      <div id="UltVen"></div>
      <table cellpadding="0" cellspacing="0" border="0" class="table table-bordered TBLrows" id="UltVenTB" style="font-size: 13px; width:100%;">
        <thead>
          <tr>
            <th>ID</th>
            <th>F.Venta</th>
            <th>F.Receta</th>
            <th>F.Cons</th>
            <th>Dosis</th>
            <th>Uni.</th>
            <th>Médico</th>
            <th>Institución</th>
            <th>Canal</th>
            <th>APM</th>
            <th>Estado</th>
            <th>Documentación</th>
          </tr>
        </thead>
        <tbody>
        </tbody>
      </table>
    </fieldset>
  </div>

  <!--  PopUP de Nueva Venta  -->
  <div id="nv" style="height: 1000px; top: 50px; padding: 10px;" class="easyui-window" data-options="modal:true, closed:true, minimizable:false, title:'Nueva Operación', closeOnEscape: true, maximized:true, inline:true">
    <iframe src="" id="if_nv" marginheight="0" marginwidth="0" scrolling="yes" noresize frameborder="0" style="width: 100%;height: 99%;"></iframe>
  </div>
  <?php
  include "../resources/Includes/BootstrapHTML5.php";
  include "../resources/Includes/DataTables.php";
  include "../resources/Includes/EasyUI.php";
  include "../resources/Includes/FormValidation.php";
  include "../resources/Includes/select2.php";
  
  ?>
  <!-- Custom JS -->
  <script type="text/javascript" language="javascript" src="../resources/JS/Develop/informes.js"></script>
</body>

</html>