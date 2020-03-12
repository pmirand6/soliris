<?php
free_all_results($db);
$sql = 'select p.apellido, p.nombre from paciente as p where p.id = {$_GET["id"]}';

$result = mysqli_query($db, $sql);

?>


<div class="container is-fluid">
   <div class="tile is-ancestor">
      <div class="tile is-parent">
         <article class="tile is-child box">
            <section class="hero is-success">
               <div class="hero-body">
                  <div class="container has-text-centered">
                     <h1 class="title">
                        Nombre del Paciente
                     </h1>
                  </div>
               </div>
               <div class="hero-foot">
                  <nav class="tabs is-boxed is-fullwidth">
                     <div class="container">
                        <ul>
                           <li class="tab is-active" onclick="openTab(event,'WebDev')"><a >Datos Personales</a></li>
                           <li class="tab" onclick="openTab(event,'WebAud')"><a >Patología</a></li>
                           <li class="tab" onclick="openTab(event,'Support')"><a >Documentos</a></li>
                        </ul>
                     </div>
                  </nav>
               </div>
            </section>
            <div class="container section">
               <div class="content-tab" id="WebDev">
                <div class="columns">
                    <?php
                        while ($row = mysqli_fetch_assoc($result)){
                            ?>
                            <div class="column is-2">
                                <?=$row["apellido"]?>
                            </div>
                            <div class="column">
                                <?=$row["nombre"]?>
                            </div>
                    <?php
                        }
                    ?>

                </div>
               </div>
               <div id="WebAud" class="content-tab" style="display:none">
                  <p>
                     test2<br>
                     Details Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                  </p>
               </div>
               <div id="Support" class="content-tab" style="display:none">
                  <p>
                     test3 <br>
                     Specification Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                  </p>
               </div>
            </div>
         </article>
      </div>
      <div class="tile is-parent">
         <article class="tile is-child box">
            <p class="title">Foo</p>
            <p class="subtitle">Bar</p>
         </article>
      </div>
   </div>
</div>

<!--<div class="container">
  <div class="col-sm-12">
    <div class="row">
      <div class="col-sm-6">
        <div class="row">
          <div class="col-md-12">
            <div class="page-header">
                <h3>Nombre del Paciente<span class="pull-right label label-default">Estado</span></h3>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
              <div class="panel with-nav-tabs panel-default">
                <div class="panel-heading text-center">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tabDatos" data-toggle="tab">Datos Personales</a></li>
                        <li><a href="#tabPat" data-toggle="tab">Patologia</a></li>
                        <li><a href="#tabDoc" data-toggle="tab">Documentacion</a></li>
                    </ul>
                </div>
                <div class="panel-body">
                    <div class="tab-content">
                      <div class="tab-pane fade in active" id="tabDatos">
                        <div class="container">
                          <div class="row">
                          </div>
                        </div>
                      </div>  
                      <div class="tab-pane fade" id="tabPat">Default 2</div>
                      <div class="tab-pane fade" id="tabDoc">Default 3</div>
                    </div>
                </div>
              </div>
          </div>
        </div>
      </div>
      <div class="col-sm-6">
        <div class="row">
            <div class="col-md-12">
              <div class="page-header">
                  <h3>Dictamen Paciente</h3>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <div class="panel panel-default">
                <div class="panel-heading">Dictamen Paciente</div>
                <div class="panel-body">
                  <?php include __DIR__.'/paciente_aprobacion.php';?>
                </div>
              </div>
            </div>
          </div>
        </div>
    </div>
  </div>
</div>-->

<script>
function openTab(evt, tabName) {
    let i, x, tablinks;
    x = document.getElementsByClassName("content-tab");
  for (i = 0; i < x.length; i++) {
      x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tab");
  for (i = 0; i < x.length; i++) {
      tablinks[i].className = tablinks[i].className.replace(" is-active", "");
  }
  document.getElementById(tabName).style.display = "block";
  evt.currentTarget.className += " is-active";
}


</script>

