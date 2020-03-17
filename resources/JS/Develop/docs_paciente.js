/**
 * Created by jgallina on 20/04/2015.
 */
var aplicacion = getCurrentHostname() + '/' + getUrlHTTP();
var paramPaciente = JSON.parse(window.localStorage.getItem('paramPaciente'));
var fecha_vacunacion;
var fecha_otro;



 $.getScript(aplicacion + '/resources/JS/funciones.min.js', function(){
    // script is now loaded and executed.
    // put your dependent JS here.
    
    $(document).ready(function(){

        $('.date').datepicker({
            format: "yyyy-mm-dd",
            language: "es",
            endDate: getDate(),
            calendarWeeks: true,
            autoclose: true,
            clearBtn: true,
            todayHighlight: true
        });


        $("#f_doc_vac").on('change', function(){
            fecha_vacunacion = this.value;
        });

        $("#f_doc_otro").on('change', function(){
            fecha_otro = this.value;
        })
               
		var Consentimiento = $("#file_consentimiento").uploadFile({
            url: aplicacion + '/ajax/ajx.docs_paciente.php',
            autoSubmit:false,
            dragDrop: false,
            fileName: "myfile",
            allowedTypes: "jpg,png,gif,doc,pdf,zip,bmp,tif",
            returnType: "json",
            dragDropStr: "<span><b>Arrastre y suelte el archivo...</b></span>",
            maxFileCount: 1,
            multiple:false,
            formData: {
                idPac: paramPaciente.idPac, 
                referencia: "Paciente", 
                tipoDoc: 'Vacunacion',
                oper: 'saveDocPac'
            },
            dynamicFormData: function()
            {
                var data = { f_doc_vac: getFechaValue('f_doc_vac') }
                return data;
            },
            onSuccess: function(files,data,xhr){
                //alert((paramPaciente.idPac));
                // $("#file_consentimiento").addClass("glyphicon glyphicon-ok");
                // ModifiedPac();
            }
        });
        var Otro = $("#file_otro").uploadFile({
            url: aplicacion + '/ajax/ajx.docs_paciente.php',
            autoSubmit:false,
            dragDrop: false,
            fileName: "myfile",
            allowedTypes: "jpg,png,gif,doc,pdf,zip,bmp,tif",
            returnType: "json",
            dragDropStr: "<span><b>Arrastre y suelte el archivo...</b></span>",
            multiple:false,
            maxFileCount: 1,
            formData: {
                idPac: paramPaciente.idPac, 
                referencia: 'Paciente', 
                tipoDoc: 'Otro',
                oper: 'saveDocPac'
            },
            dynamicFormData: function()
            {
                var data = { 
                    f_doc_otro: getFechaValue('f_doc_otro') 
                }
                return data;
            },
            onSuccess: function(files,data,xhr){
                //alert((data));
            }
        });
        $('#save').click(function () {
            var $btn = $(this).button('loading')
            Consentimiento.startUpload();
            Otro.startUpload();
            window.location.href = aplicacion + '/administrador/pacientes.php?id=' + paramPaciente.idPac;
            $btn.button('reset');

        });
		
		
        $('#Docs').click(function () {
            if (getQuerystring("id") != ''){
                var $btn = $(this).button('loading')
                window.location.href = aplicacion + '/administrador/paciente.php?id=' + paramPaciente.idPac;
                $btn.button('reset');
            }
        });
    });
});

// Documentacion Paciente modificado se debe actualizar el estado a Pendiente
// para que sea revisada la documentacion por FV
function DocPacModified(){
  var parametros = {
      "oper": "DocPacModified",
      "id": $('#id').val()
  };
  $.ajax({
      url: aplicacion + '/ajax/ajx.docs_paciente.php',
      type: "POST",
      data: parametros,
      async: false,
      success: function(opciones) {
          if (opciones.indexOf("ERROR") != 0) {
              alert('Se registró correctamente, ya puede cerrar esta ventana');
              setTimeout(function(){ window.location.href = aplicacion + '/administrador/docs_paciente.php?id=' + opciones; }, 3000);
          } else {
              alert(opciones);
          }
      }
  });
}

function getCurrentHostname(){
    var protocolo, url, var_port, port;

    protocolo = window.location.protocol;
    url = window.location.hostname;
    var_port = window.location.port;

    if (var_port !== '') {
        port = ':' + var_port;
    } else {
        port = '';
    }

    return protocolo + '//' + url + port;
}

function getUrlHTTP() {

    var path = window.location.pathname;
    var appName = path.split("/");
    return appName[1];
}


function getFechaValue($id){
    return $('#' + $id + '').val();
}