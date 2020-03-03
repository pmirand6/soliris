/**
 * Created by jgallina on 20/04/2015.
 */
var aplicacion = getCurrentHostname() + '/' + getUrlHTTP();
 $.getScript(aplicacion + '/resources/JS/funciones.min.js', function(){
    // script is now loaded and executed.
    // put your dependent JS here.
    $(document).ready(function(){
    
		var Consentimiento = $("#file_consentimiento").uploadFile({
            url: aplicacion + '/resources/JQuery-FileUpload/PHP/upload.php',
            autoSubmit:false,
            dragDrop: false,
            fileName: "myfile",
            allowedTypes: "jpg,png,gif,doc,pdf,zip,bmp,tif",
            returnType: "json",
            dragDropStr: "<span><b>Arrastre y suelte el archivo...</b></span>",
            maxFileCount: 1,
            multiple:false,
            formData: {"id": $('#id').val(), "referencia": "pacientes", "tipo": 'Consentimiento'},
            onSuccess: function(files,data,xhr){
                //alert((data));
                // $("#file_consentimiento").addClass("glyphicon glyphicon-ok");
                // ModifiedPac();
            }
        });
        var Otro = $("#file_otro").uploadFile({
            url: aplicacion + '/resources/JQuery-FileUpload/PHP/upload.php',
            autoSubmit:false,
            dragDrop: false,
            fileName: "myfile",
            allowedTypes: "jpg,png,gif,doc,pdf,zip,bmp,tif",
            returnType: "json",
            dragDropStr: "<span><b>Arrastre y suelte el archivo...</b></span>",
            multiple:false,
            maxFileCount: 1,
            formData: {"id": $('#id').val(), "referencia": "pacientes", "tipo": 'Otro'},
            onSuccess: function(files,data,xhr){
                //alert((data));
            }
        });
			$('#save').click(function () {
				var $btn = $(this).button('loading')
				Consentimiento.startUpload();
				Otro.startUpload();
				ModifiedPac()
				window.location.href = aplicacion + '/administrador/pacientes.php?id=' + getQuerystring("id");
				$btn.button('reset');

			});
		
		
        $('#Docs').click(function () {
            if (getQuerystring("id") != ''){
                var $btn = $(this).button('loading')
                window.location.href = aplicacion + '/administrador/paciente.php?id=' + getQuerystring("id");
                $btn.button('reset');
            }
        });
    });
});


function ModifiedPac(){
  var parametros = {
      "oper": "ModifiedPac",
      "id": $('#id').val()
  };
  $.ajax({
      url: aplicacion + '/ajax/ajx.paciente_form.php',
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
