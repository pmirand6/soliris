//VARIABLES GLOBALES
// FIXME VERIFICAR ESTA VARIABLE
var grupo_usuario = ""; //VARIABLE DE GRUPO DE USUARIO
var aplicacion = getCurrentHostname() + "/" + getUrlHTTP();
var idPac;

$.getScript(aplicacion + "/resources/JS/funciones.min.js", function() {
  $(document).ready(function() {
    $("#nv").window({
      modal: true,
      closed: true,
      minimizable: false,
      maximizable: false,
      title: "Nueva Operación",
      closeOnEscape: true,
      draggable: false,
      maximized: true,
      inline: true,
      collapsible: false,
      constrain: true,
      onBeforeClose: function() {
        window.location.href = window.location.href;
      }
    });
    $(".panel-tool-close").click(function() {
      window.location.href = window.location.href;
    });

    $("#medico").keyup(function() {
      var minlength = 3;
      var searchField = $("#medico").val();
      var regex = new RegExp(searchField, "i");
      var output = '<div class="list is-hoverable">';
      var count = 1;
      var url_json = aplicacion + "/ajax/ajx.medicos.php?q=" + searchField;
      if (searchField != null && searchField.length >= minlength) {
        $.getJSON(url_json, function(data) {
          if (data.length != 0) {
            $.each(data, function(key, val) {
              if (val.text.search(regex) != -1) {
                output += `<a class="list-item" id="span_medico" data-id="${val.id}">${val.text}`;
                if (count % 2 == 0) {
                  output += "</a>";
                }
                count++;
              }
            });
            output += "</div>";
            $("#result_medicos").html(output);
          } else {
            output += `<a class="list-item">No se encontraron resultados</a></div>`;
            $("#result_medicos").html(output);
          }
        });
      } else {
        if (searchField.length < minlength) {
          output += `<a class="list-item">Ingrese más de 3 letras</a></div>`;
          $("#result_medicos").html(output);
        }
      }
    });
  });
});

$(document).on("click", "#span_medico", function() {
  var idMedico = $(this)
    .attr("data-id")
    .toLowerCase();
  var n_medico = $(this).text();
  $("#medico").data("id", idMedico);
  $("#medico").val(n_medico);
  if ($("#usuario").val() == n_medico) {
    /*    if (n_usuario === mail_check) {
      usuario_ok = 1;
      $(".form").formValidation("revalidateField", "usuario");
    } else {
      usuario_ok = 0;
      $(".form").formValidation("revalidateField", "usuario");
    }*/
  }
  $("#result_medicos").html("");
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
