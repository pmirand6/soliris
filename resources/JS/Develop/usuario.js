/**
 * Created by jgallina on 30/04/2015.
 */
var usuario_ok = 0;
var aplicacion = getCurrentHostname() + "/" + getUrlHTTP();
$.getScript(aplicacion + "/resources/JS/funciones.min.js", function () {
  // script is now loaded and executed.
  // put your dependent JS here.
  $(document).ready(function () {
    var minlength = 3;
    var searchField = null;

    if(!getQuerystring('id')){
        $("#nombreSelect").select2({
            theme: "bootstrap",
            placeholder: "Seleccione un Usuario",
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
            templateSelection: function (data, container) {
              console.log(data.element);
              $("#mail").val(data.id);
              $(data.element).attr("data-username", data.username);
              return data.text;
            },
          });
    }

    
    if (getQuerystring("id")) {
      $(".form").formValidation("removeField", "nombreSelect");
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
          grupo: {
            validators: {
              notEmpty: {
                message: "El grupo del usuario no puede quedar vacío",
              },
            },
          },
          mail: {
            validators: {
              emailAddress: {
                message:
                  "Por favor, ingrese una dirección de e-mail o deje vacío el campo",
              },
              regexp: {
                regexp: /^\S+@\S+\.\S+$/, //Validación para doble dominio
                message: "El formato del e-mail no es válido",
              },
              stringLength: {
                min: 4,
                max: 90,
                message:
                  "El e-mail debe contener como mínimo 4 y como máximo 90 caracteres",
              },
              notEmpty: {
                message: "El email del usuario no puede quedar vacío",
              },
            },
          },
          estado: {
            validators: {
              notEmpty: {
                message: "El Estado del usuario no puede quedar vacío",
              },
            },
          },
          familia: {
            message: "La familia no es válida",
            validators: {
              stringLength: {
                min: 3,
                max: 3,
                message:
                  "El formato de la familia debe estar formado por 3 caracteres",
              },
            },
          },
        },
      })
      .on("success.form.fv", function (e) {
        // Prevent form submission
        e.preventDefault();

        var parametros = {
          oper: "Guardar",
          id: $("#id").val(),
          rol: $("#rol").val(),
          mail: $("#mail").val(),
          estado: $("#estado").val(),
          familia: $("#familia").val(),
        };
        if(getQuerystring('id')){
            parametros.usuario = $("#nombre").val();
        } else {
            parametros.usuario = $('#nombreSelect').find(':selected').attr('data-username');
        }
        $.ajax({
          url: aplicacion + "/ajax/ajx.usuario_form.php",
          type: "POST",
          data: parametros,
          success: function (opciones) {
            if (opciones.indexOf("ERROR") != 0) {
              alert("Se registró correctamente, ya puede cerrar esta ventana");
              window.location.href =
                aplicacion +
                "/administrador/usuarios.php?id=" +
                getQuerystring("id");
            } else {
              alert(opciones);
            }
          },
        });
      })
      .submit(function (e) {
        e.preventDefault();
      });

    $("#estado").change(function () {
      if ($("#estado").val() != "") {
        $("#icon_estado").removeClass();
        $("#icon_estado").addClass(
          "TBL TBL-" + $("#estado").val().replace(" ", "_")
        );
      } else {
        $("#icon_estado").removeClass();
        $("#icon_estado").addClass("fa fa-check-circle-o");
      }
    });
  });
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
