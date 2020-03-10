<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>


<div class="easyui-layout" data-options="fit:true">
   <div data-options="region:'north'" style="height:10%" class="head_barra col-sm-12 col-xs-12">
      <div class="col-sm-1 col-xs-1">
         <img src="resources/IMG/soliris.svg" class="logo img-rounded">
      </div>
      <div class="col-sm-9 col-xs-8">
         <p id="info" style="text-align:right;vertical-align: middle;"></p>
      </div>
      <!--      Botones de usuario y LogOut      -->
      <div class="col-sm-2 col-xs-3 text-right" id="botonesHeader">
         <div class="btn-group" role="group">
            <button type="button" id="user" class="btn btn-info pointer fa fa-user" data-container="body" data-toggle="popover">
            <b style="margin-left: 10px">PMIRANDA</b>
            </button>
         </div>
         <div id="popoverUser" class="hidden">
            <div>
               <form id="frm_grupo">
                  <span>Cambiar Grupo: </span>
                  <div class="form-check">
                     <label class="form-check-label">
                     <input class="form-check-input" type="radio" value="ventas" onclick="change_location(this.value);" >
                     Ventas 
                     </label>
                  </div>
                  <div class="form-check">
                     <label class="form-check-label">
                     <input class="form-check-input" type="radio" value="fv" onclick="change_location(this.value);" >
                     FV
                     </label>
                  </div>
                  <div class="form-check">
                     <label class="form-check-label">
                     <input class="form-check-input" type="radio" value="marketing" onclick="change_location(this.value);" >
                     MKT
                     </label>
                  </div>
               </form>
               <p><b>Usuario: pmiranda</b></p>
               <p><b>Grupo: admin</b></p>
               <p class="text-right">
                  <a class="btn btn-default pointer fa fa-history" title="Historial" id="history" onclick="viewHistory();"></a>
                  <a class="btn btn-danger pointer fa fa-power-off" title="Desloguearse" id="logoff" onclick="deleteProfile();"></a>
               </p>
            </div>
         </div>
      </div>
   </div>
   <!--    Navegador   -->
   <div class=" head_barra col-sm-1 col-xs-2" data-options="region:'west',split:true,title:'Navegador'" href="nav.php" id="nav"></div>
   <!--    Principal   -->
   <div class="col-sm-11 col-xs-10" data-options="region:'center'" id="main" style="width: 100%; height: 100% ; overflow: hidden">
      <iframe id="if_main" src="" marginheight="0" marginwidth="0" noresize frameborder="0"></iframe>
   </div>
</div>
    
</body>
</html>