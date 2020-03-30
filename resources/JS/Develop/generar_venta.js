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
    l_set_select_medico();
    l_set_select_canal();
    l_set_select_institucion();
    l_set_datepicker();
    l_validate_form();
    l_set_presentacion();
    l_set_paciente();
  });
});

function l_generar_venta() {
  let myForm = document.getElementById('frmVenta');
  var form = new FormData(myForm);
  form.append("oper", "guardar_venta");
  form.append("idPresentacion", $("#presentacion").val());
  form.append("idPac", getQuerystring("idPac"));
  form.append("idMedico", $("#medico").data('id'));
  form.append("cantUnidades", $("#cantDosis").val());
  form.append("fecha_venta", getDate());
  form.append("idInstitucion", $("#institucion").data('id'));
  form.append("idCanal", $("#canal").data('id'));
  form.append("idDosis", $("#dosis").val());

  var settings = {
    url: aplicacion + "/ajax/ajx.generar_venta.php",
    method: "POST",
    processData: false,
    mimeType: "multipart/form-data",
    contentType: false,
    data: form
  };

  $.ajax(settings).done(function(response) {
    console.log(response)
  });
}

function l_set_paciente() {
  $.post(
    aplicacion + "/ajax/ajx.paciente.php",
    { oper: "showPaciente", id: getQuerystring("idPac") },
    function(data) {
      $.map(data, function(e) {
        $("#nombrePaciente").html(e.nombre_completo);
      });
    },
    "json"
  );
}

function l_set_presentacion() {
  $.getJSON(
    aplicacion + "/ajax/ajx.presentacion.php",
    { oper: "getPresentacion" },
    function(data, textStatus, jqXHR) {
      $.each(data, function(i, v) {
        $("#presentacion").val(v.id);
        $("#presentacionTitle").html(v.valor);
        l_set_select_dosis(v.id);
      });
    }
  );
}

function l_validate_form() {
  FormValidation.formValidation(document.getElementById("frmVenta"), {
    fields: {
      medico: {
        validators: {
          notEmpty: {
            message: "Debe seleccionar un médico"
          }
        }
      },
      dosis: {
        validators: {
          notEmpty: {
            message: "Debe seleccionar una dosís"
          }
        }
      },
      cantDosis: {
        message: "El nombre de la ciudad no es válida",
        validators: {
          regexp: {
            regexp: /^[0-9]*$/,
            message: "Este campo debe contener solo números."
          },
          greaterThan: {
            min: 1,
            message: "El valor indicado debe ser mayor a 0"
          },
          notEmpty: {
            message: "Debe indicar la cantidad de Dosis"
          }
        }
      },
      canal: {
        validators: {
          notEmpty: {
            message: "Debe seleccionar un canal"
          }
        }
      },
      institucion: {
        validators: {
          notEmpty: {
            message: "Debe seleccionar una institución"
          }
        }
      },
      f_receta: {
        validators: {
          date: {
            format: "DD-MM-YYYY",
            message: "El formato es invalido"
          },
          notEmpty: {
            message: "La Fecha de Receta no puede quedar vacía"
          }
        }
      },
      file_receta: {
        validators: {
          notEmpty: {
            message: "Debe Seleccionar una receta"
          },
          file: {
            extension: "jpg,png,gif,doc,pdf,zip,bmp,tif",
            type:
              "image/jpeg,image/png,image/gif,application/msword,application/pdf,application/zip,image/x-ms-bmp,image/tiff",
            maxSize: 2097152, // 2048 * 1024
            message: "El archivo seleccionado no es válido"
          }
        }
      }
    },
    plugins: {
      trigger: new FormValidation.plugins.Trigger(),
      bulma: new FormValidation.plugins.Bulma(),
      submitButton: new FormValidation.plugins.SubmitButton(),
      icon: new FormValidation.plugins.Icon({
        valid: "fa fa-check",
        invalid: "fa fa-times",
        validating: "fa fa-refresh"
      })
    }
  }).on("core.form.invalid", function() {})
  .on("core.form.valid", function(){
    l_generar_venta();
  })
  ;
}

function l_set_datepicker() {
  $(".date").datepicker({
    format: "dd-mm-yyyy",
    language: "es",
    endDate: getDate(),
    calendarWeeks: true,
    autoclose: true,
    clearBtn: true,
    todayHighlight: true
  });
}

function l_set_select_medico() {
  $("#helpMedico").addClass("is-success");
  $("#helpMedico").html("* Comience a escribir para seleccionar un médico");
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
          $("#helpMedico").removeClass("is-success");
          $("#helpMedico").addClass("is-danger");
          $("#helpMedico").html("* No se encontraron resultados");
          $("#result_medicos").html("");
        }
      });
    } else {
      if (searchField.length < minlength) {
        output += `<a class="list-item">Ingrese más de 3 letras</a></div>`;
        $("#result_medicos").html(output);
      }
    }
  });

  $(document).on("click", "#span_medico", function() {
    var idMedico = $(this)
      .attr("data-id")
      .toLowerCase();
    var n_medico = $(this).text();
    $("#medico").data("id", idMedico);
    $("#medico").val(n_medico);
    if ($("#medico").val() == n_medico) {
      $("#helpMedico").html("");
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
}

function l_set_select_canal() {
  $("#helpCanal").addClass("is-success");
  $("#helpCanal").html("* Comience a escribir para seleccionar un Canal");
  $("#canal").keyup(function() {
    var minlength = 3;
    var searchField = $("#canal").val();
    var regex = new RegExp(searchField, "i");
    var output = '<div class="list is-hoverable">';
    var count = 1;
    var url_json = aplicacion + "/ajax/ajx.canales.php?q=" + searchField;
    if (searchField != null && searchField.length >= minlength) {
      $.getJSON(url_json, function(data) {
        if (data.length != 0) {
          $.each(data, function(key, val) {
            if (val.text.search(regex) != -1) {
              output += `<a class="list-item" id="span_canal" data-id="${val.id}">${val.text}`;
              if (count % 2 == 0) {
                output += "</a>";
              }
              count++;
            }
          });
          output += "</div>";
          $("#result_canal").html(output);
        } else {
          $("#result_canal").html("");
          $("#helpCanal").html("");
          $("#helpCanal").removeClass("is-success");
          $("#helpCanal").addClass("is-danger");
          $("#helpCanal").html("* No se encontraron resultados");
        }
      });
    } else {
      if (searchField.length + 1 < minlength) {
        output += `<a class="list-item">Ingrese más de 3 letras</a></div>`;
        $("#result_canal").html(output);
      }
    }
  });

  $(document).on("click", "#span_canal", function() {
    var idCanal = $(this)
      .attr("data-id")
      .toLowerCase();
    var n_canal = $(this).text();
    $("#canal").data("id", idCanal);
    $("#canal").val(n_canal);
    if ($("#canal").val() == n_canal) {
      $("#helpCanal").html("");

      /*    if (n_usuario === mail_check) {
        usuario_ok = 1;
        $(".form").formValidation("revalidateField", "usuario");
      } else {
        usuario_ok = 0;
        $(".form").formValidation("revalidateField", "usuario");
      }*/
    }
    $("#result_canal").html("");
  });
}

function l_set_select_institucion() {
  $("#helpInstitucion").addClass("is-success");
  $("#helpInstitucion").html(
    "* Comience a escribir para seleccionar una Institución"
  );
  $("#institucion").keyup(function() {
    var minlength = 3;
    var searchField = $("#institucion").val();
    var regex = new RegExp(searchField, "i");
    var output = '<div class="list is-hoverable">';
    var count = 1;
    var url_json = aplicacion + "/ajax/ajx.instituciones.php?q=" + searchField;
    if (searchField != null && searchField.length >= minlength) {
      $.getJSON(url_json, function(data) {
        if (data.length != 0) {
          $.each(data, function(key, val) {
            if (val.text.search(regex) != -1) {
              output += `<a class="list-item" id="span_institucion" data-id="${val.id}">${val.text}`;
              if (count % 2 == 0) {
                output += "</a>";
              }
              count++;
            }
          });
          output += "</div>";
          $("#result_institucion").html(output);
        } else {
          $("#result_institucion").html("");
          $("#helpInstitucion").html("");
          $("#helpInstitucion").removeClass("is-success");
          $("#helpInstitucion").addClass("is-danger");
          $("#helpInstitucion").html("* No se encontraron resultados");
        }
      });
    } else {
      if (searchField.length + 1 < minlength) {
        output += `<a class="list-item">Ingrese más de 3 letras</a></div>`;
        $("#result_institucion").html(output);
      }
    }
  });

  $(document).on("click", "#span_institucion", function() {
    var idInstitucion = $(this)
      .attr("data-id")
      .toLowerCase();
    var n_institucion = $(this).text();
    $("#institucion").data("id", idInstitucion);
    $("#institucion").val(n_institucion);
    if ($("#institucion").val() == n_institucion) {
      $("#helpInstitucion").html("");

      /*    if (n_usuario === mail_check) {
        usuario_ok = 1;
        $(".form").formValidation("revalidateField", "usuario");
      } else {
        usuario_ok = 0;
        $(".form").formValidation("revalidateField", "usuario");
      }*/
    }
    $("#result_institucion").html("");
  });
}

function l_set_select_dosis($presentacion) {
  $.getJSON(
    aplicacion + "/ajax/ajx.dosis.php",
    { oper: "getDosis", presentacion: $presentacion },
    function(data) {
      var items = [];
      $.each(data, function(key, val) {
        items.push("<option value='" + val.id + "'>" + val.valor + "</option>");
      });
      $("#dosis").append(items);
    }
  );
}

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
