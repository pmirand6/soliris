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
                           <li class="tab is-active" onclick="openTab(event,'datosPac')"><a >Datos Paciente</a></li>
                           <li class="tab" onclick="openTab(event,'docsPac')"><a >Documentos</a></li>
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
                        <?php include __DIR__.'/documentacion_paciente.php';?>
                     </div>
                  </div>
               </div>
            </div>
         </article>
         
      </div>
      <div class="tile is-parent is-6">  
         <div class="box">
            <section class="hero is-info">
               <div class="hero-body">
                  <div class="container has-text-centered">
                     <h1 class="title">
                        Dictamen Paciente
                     </h1>
                  </div>
               </div>
            </section>
            <article class="tile is-child box">
               <?php include __DIR__.'/paciente_aprobacion.php';?>
            </article>
         </div>
      </div>
   </div>
</div>

<div class="modal" id="modalDocumentacionPaciente">
  <div class="modal-background"></div>
  <div class="modal-content">
    <p class="image is-4by3">
      <img id="imgModalDocumentacionPaciente" src="" alt="">
    </p>
  </div>
  <button class="modal-close is-large" aria-label="close"></button>
</div>

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