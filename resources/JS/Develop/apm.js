/**
 * Created by jgallina on 30/04/2015.
 */
var usuario_ok = 0;
var aplicacion = getCurrentHostname() + "/" + getUrlHTTP();
$.getScript(aplicacion + "/resources/JS/funciones.min.js", function () {
  $(document).ready(function () {
    var minlength = 3;
    var searchField = null;

    $("#nombreSelect").select2({
      theme: "bootstrap",
      placeholder: "Seleccione un APM",
      minimumInputLength: 3,
      allowClear: true,
      language: "es",
      ajax: {
        url: aplicacion + "/ajax/ajx.usuarios_ad.php",
        dataType: "json",
        delay: 250,
        data: function (params) {
          return {
            q: params.term, // search term
            page: params.page,
          };
        },
        processResults: function (data) {
          return {
            results: data,
          };
        },
        cache: true,
      },
      //templateResult: formatRepo,
      templateSelection: function(data, container){
        console.log(data.element);
        $(data.element).attr('data-username', data.username);
        return data.text;
      }
    });

    if(getQuerystring("id")){
        $('.form').formValidation('removeField', 'nombreSelect');
    }

    
    $(".form")
      .formValidation({
        framework: "bootstrap",
        excluded: ":disabled",
        icon: {
          valid: "glyphicon glyphicon-ok",
          invalid: "glyphicon glyphicon-remove",
          validating: "glyphicon glyphicon-refresh",
        },
        fields: {
          nombreSelect: {
            validators: {
              notEmpty: {
                message: "Debe Seleccionar un APM",
              },
            },
          },
          estado: {
            validators: {
              notEmpty: {
                message: "El estado no puede quedar vacío",
              },
            },
          },
        },
      })
      .on("success.form.fv", function (e) {
        $("#bot_guardar").addClass("disabled");
        // Prevent form submission
        e.preventDefault();

        var parametros = {
          oper: "Guardar",
          id: $("#id").val(),
          username: $('#nombreSelect').find(':selected').attr('data-username'),
          email: $('#nombreSelect').find(':selected').val(),
          nombreCompleto: $('#nombreSelect').find(':selected').text(),
          estado: $("#estado").val(),
        };
        $.ajax({
          url: aplicacion + "/ajax/ajx.apm_form.php",
          type: "POST",
          data: parametros,
          success: function (opciones) {
            if (opciones.indexOf("ERROR") != 0) {
              alert("Se registró correctamente, ya puede cerrar esta ventana");
              window.top.location.reload();
            } else {
              alert(opciones);
            }
          },
        });
      })
      .submit(function (e) {
        e.preventDefault();
      });
  });
});

$(document).on("click", "#span_user", function () {
  $("#nombre").val($(this).text());
  if ($("#nombre").val() == $(this).text()) {
    usuario_ok = 1;
    $(".form").formValidation("revalidateField", "nombre");
  }
  $("#result_usuarios").html("");
});

function getCurrentHostname() {
  var protocolo, url, var_port, port;

  protocolo = window.location.protocol;
  url = window.location.hostname;
  var_port = window.location.port;

  if (var_port !== "") {
    port = ":" + var_port;
  } else {
    port = "";
  }

  return protocolo + "//" + url + port;
}

function getUrlHTTP() {
  var path = window.location.pathname;
  var appName = path.split("/");
  return appName[1];
}
