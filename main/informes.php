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
    /* Bulma CSS */
    @import "../resources/CSS/bulma/css/bulma.css";
    /* Select2 CSS */
    @import "../resources/select2/dist/css/select2.min.css";
    /* Font-Awesome */
    @import "../resources/CSS/Font-Awesome-4.5.0/css/font-awesome.min.css";
    /* Iconos de Estados */
    @import "../resources/Sprites/spriteListado.css";
    /* Style Datatable Bulma CSS */
    @import "../resources/datatables-bulma/css/dataTables.bulma.css";
    /* Custom CSS */
    @import "../resources/CSS/Develop/informes.css";
  </style>

</head>

<body>
  <br>
  <section class="hero is-primary" id="titulo">
    <div class="hero-body">
      <div class="container">
        <h1 class="title">
          Alta de Venta
        </h1>
        <h2 class="subtitle">
          Por favor seleccione un paciente para realizar la venta
        </h2>

        <form id="form-select" class="form-horizontal form">
          <section class="section">
            <div class="container">
              <h1 class="title">
                Bulmahead
              </h1>
              <p class="subtitle">
                An easy implementation of an autocomplete component with <strong>Bulma</strong>!
              </p>
              <p class="is-size-2 has-text-primary" style="display: none">You just selected: <span class="has-text-danger" id="selected"></span>!</p>
              <br />
              <div class="dropdown">
                <div class="dropdown-trigger">
                  <input id="prova" class="input" type="text" placeholder="I ❤️ USA" aria-haspopup="true" aria-controls="prova-menu">
                </div>
                <div class="dropdown-menu" id="prova-menu" role="menu" />
              </div>
            </div>
          </section>
          <div class="field">
            <p class="control">
              <span class="select is-fullwidth">
                <select2 id="paciente" name="paciente" placeholder="Select Role">
                </select2>
              </span>
            </p>
          </div>
          <div class="field">
            <div class="control">
              <button type="submit" id="buscar" name="buscar" class="button is-info">
                <span class="fa fa-search"></span>
                Buscar
              </button>
              <i id="loading" class="fa fa-spinner fa-pulse"></i>
            </div>
          </div>
          <div class="field">
            <div class="control">
              <button type="button" id="new-search" name="new-search" class="button is-primary">
                Nueva Busqueda
              </button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </section>
  <section>
  </section>
  <div class="container is-fluid">
    <div class="tile is-ancestor">
      <div class="tile is-parent is-7">
        <article class="tile is-child box">
          <section class="hero" id="heroHeadPac">
            <div class="hero-body">
              <div class="container has-text-centered">
                <h1 class="title" id="nombrePac">
                  <!-- Nombre del Paciente -->
                </h1>
                <nav class="level">
                  <div class="level-item has-text-centered">
                    <div>
                      <p class="heading">ID Paciente</p>
                      <span class="tag" id="idPac"></span>
                    </div>
                  </div>
                  <div class="level-item has-text-centered">
                    <div>
                      <p class="heading">Usuario Creador</p>
                      <span class="tag" id="usuarioCreador"></span>
                    </div>
                  </div>
                  <div class="level-item has-text-centered">
                    <div>
                      <p class="heading">Fecha Creación</p>
                      <span class="tag" id="fechaCreacion"></span>
                    </div>
                  </div>
                  <div class="level-item has-text-centered">
                    <div>
                      <p class="heading">Estado</p>
                      <span class="tag" id="estadoPac"></span>
                    </div>
                  </div>
                </nav>
              </div>
            </div>
            <div class="hero-foot">
              <nav class="tabs is-boxed is-fullwidth">
                <div class="container">
                  <ul>
                    <li class="tab is-active" onclick="openTab(event,'datosPac')"><a>Datos Paciente</a></li>
                    <li class="tab" onclick="openTab(event,'docsPac')"><a>Documentos</a></li>
                  </ul>
                </div>
              </nav>
            </div>
          </section>
          <div class="container  section">
            <div class="content-tab" id="datosPac">
              <div class="box is-info has-background-white-ter">
                <div class="columns">
                  <div class="column">
                    <p>
                      <label class="subtitle is-size-6 has-text-grey">Sexo: </label>
                      <span class="title is-size-6 has-text-grey-darker" id="sexoPac"></span>
                    </p>
                    <p>
                      <label class="subtitle is-size-6 has-text-grey">Fecha Nacimiento: </label>
                      <span class="title is-size-6 has-text-grey-darker" id="fechaNacPac"></span>
                    </p>
                    <p>
                      <label class="subtitle is-size-6 has-text-grey">Edad: </label>
                      <span class="title is-size-6 has-text-grey-darker" id="f_edad"></span>
                    </p>
                    <p>
                      <label class="subtitle is-size-6 has-text-grey">OS: </label>
                      <span class="title is-size-6 has-text-grey-darker" id="osPac"></span>
                    </p>
                    <p>
                      <label class="subtitle is-size-6 has-text-grey">CRM ID: </label>
                      <span class="title is-size-6 has-text-grey-darker" id="crmId"></span>
                    </p>
                    <p>
                      <label class="subtitle is-size-6 has-text-grey">Sub Estado: </label>
                      <span class="title is-size-6 has-text-grey-darker" id="subEstadoPac"></span>
                    </p>
                  </div>
                  <div class="column">
                    <p>
                      <label class="subtitle is-size-6 has-text-grey">Ciudad: </label>
                      <span class="title is-size-6 has-text-grey-darker" id="ciudadPac"></span>
                    </p>
                    <p>
                      <label class="subtitle is-size-6 has-text-grey">Pais: </label>
                      <span class="title is-size-6 has-text-grey-darker" id="paisPac"></span>
                    </p>
                    <p>
                      <label class="subtitle is-size-6 has-text-grey">Mail: </label>
                      <span class="title is-size-7 has-text-grey-darker" id="emailPac"></span>
                    </p>
                    <p>
                      <label class="subtitle is-size-6 has-text-grey">Telefono: </label>
                      <span class="title is-size-6 has-text-grey-darker" id="telPac"></span>
                    </p>
                  </div>
                </div>
                <div class="columns">
                  <div class="column">
                    <p class="subtitle is-size-6 has-text-grey">Patologia </p>
                    <p class="title is-size-6 has-text-grey-darker" id="patPac"></p>
                  </div>
                  <div class="column">
                    <p class="subtitle is-size-6 has-text-grey">Sub Patologia </p>
                    <p class="title is-size-6 has-text-grey-darker" id="subPatPac"></p>
                  </div>
                </div>
              </div>
            </div>
            <div id="docsPac" class="content-tab" style="display:none">
              <div class="columns">
                <div class="column">
                  <?php include __DIR__ . '/documentacion_paciente.php'; ?>
                </div>
              </div>
            </div>
          </div>
        </article>
      </div>
    </div>


    <div class="container is-fluid">
      <h4 class="subtitle">Datos del Paciente</h4>
      <table class="table table-bordered" id="PacDat">
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
    </div>

    <!-- Se carga de un div externo a esta pagina -->
    <!--<div id="PacDat"></div>-->


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
      <legend>Últimas Ventas</legend>
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


    <!--  PopUP de Nueva Venta  -->
    <div id="nv" style="height: 1000px; top: 50px; padding: 10px;" class="easyui-window" data-options="modal:true, closed:true, minimizable:false, title:'Nueva Operación', closeOnEscape: true, maximized:true, inline:true">
      <iframe src="" id="if_nv" marginheight="0" marginwidth="0" scrolling="yes" noresize frameborder="0" style="width: 100%;height: 99%;"></iframe>
    </div>
    <?php
    include "../resources/Includes/BootstrapHTML5.php";
    include "../resources/Includes/FormValidation.php";
    include "../resources/Includes/Datatables.php";
    include "../resources/Includes/EasyUI.php";
    include "../resources/Includes/select2.php";
//    include "../resources/Includes/datatables-bulma.php";
  
    ?>
    <!-- Custom JS -->
    <script src="https://cdn.rawgit.com/mattmezza/bulmahead/master/dist/bulmahead.bundle.js"></script>


    <script>
      var api = function(inputValue) {
        return fetch('https://cdn.rawgit.com/mshafrir/2646763/raw/8b0dbb93521f5d6889502305335104218454c2bf/states_titlecase.json').then(function(resp) {
          return resp.json()
        }).then(function(states) {
          return states.filter(function(state) {
            return state.name.startsWith(inputValue)
          })
        }).then(function(filtered) {
          return filtered.map(function(state) {
            return {
              label: state.name,
              value: state.abbreviation
            }
          })
        }).th
        en(function(transformed) {
          return transformed.slice(0, 5)
        })
      }

      var onSelect = function(state) {
        var selected = document.getElementById("selected")
        selected.innerHTML = '{label: "' + state.label + '", value: "' + state.value + '"}'
        selected.parentNode.style.display = 'block'
      }
      bulmahead('prova', 'prova-menu', api, onSelect, 200);
    </script>
    <script type="text/javascript" language="javascript" src="../resources/JS/Develop/informes.js"></script>
</body>

</html>