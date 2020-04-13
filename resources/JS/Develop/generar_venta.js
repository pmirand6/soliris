//VARIABLES GLOBALES
// FIXME VERIFICAR ESTA VARIABLE
var grupo_usuario = ""; //VARIABLE DE GRUPO DE USUARIO
var aplicacion = getCurrentHostname() + "/" + getUrlHTTP();
var idPac;

var fv;

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
    l_set_producto();
    l_set_paciente();

    $("#canVenta").click(function(e) {
      parent.location.reload();
    });
  });
});

function l_generar_venta() {
  let myForm = document.getElementById("frmVenta");
  var form = new FormData(myForm);
  form.append("oper", "guardar_venta");
  form.append("idProducto", $("#producto").val());
  form.append("idPac", getQuerystring("idPac"));
  form.append("idMedico", $("#medico").data("id"));
  form.append("cantUnidades", $("#cantDosis").val());
  form.append("idInstitucion", $("#institucion").data("id"));
  form.append("idCanal", $("#canal").data("id"));
  form.append("idPresentacion", $("#presentacion").val());

  var settings = {
    url: aplicacion + "/ajax/ajx.generar_venta.php",
    method: "POST",
    processData: false,
    mimeType: "multipart/form-data",
    contentType: false,
    data: form
  };

  $.ajax(settings).done(function(response) {
  
  let data = JSON.parse(response)
  console.log(data)
    Swal.fire({
      title: data.title,
      icon: data.icon,
      text: data.text,
      timer: 5000
    }).then(function() {
      //parent.location.reload();
    });
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

function l_set_producto() {
  $.getJSON(
    aplicacion + "/ajax/ajx.producto.php",
    { oper: "getproducto" },
    function(data, textStatus, jqXHR) {
      $.each(data, function(i, v) {
        $("#producto").val(v.id);
        $("#productoTitle").html(v.valor);
        l_set_select_presentacion(v.id);
      });
    }
  );
}

function l_validate_form() {
  const noExiste = function() {
    return {
      validate: function(input) {
        return {
          valid: false,
          message: "* No se encontraron coincidencias"
        };
      }
    };
  };

  const dateValidators = {
    validators: {
      date: {
        format: "DD-MM-YYYY",
        message: "El formato es invalido"
      },
      notEmpty: {
        message: "Debe indicar una fecha para este Documento"
      }
    }
  };

  const fileValidators = {
    validators: {
      notEmpty: {
        message: "Debe Seleccionar un Archivo"
      },
      file: {
        extension: "jpg,png,gif,doc,pdf,zip,bmp,tif",
        type:
          "image/jpeg,image/png,image/gif,application/msword,application/pdf,application/zip,image/x-ms-bmp,image/tiff",
        maxSize: 2097152, // 2048 * 1024
        message: "El archivo seleccionado no es válido"
      }
    }
  };

  // Registrando custom validator
  FormValidation.validators.noExiste = noExiste;

  //Instancia del form
  fv = FormValidation.formValidation(document.getElementById("frmVenta"), {
    fields: {
      medico: {
        validators: {
          noExiste: {
            enable: false
          },
          stringLength: {
            min: 3,
            message: "Ingrese más de 3 letras"
          },
          checkMedico: {
            message: "Seleccione un médico del Listado",
            callback: function(input) {
              const medicoSelected = document
                .getElementById("frmVenta")
                .querySelector('[name="medicoSelected"]').value;
              if (input == "" && medicoSelected == "") {
                return true;
              } else {
                return input.value == medicoSelected;
              }
            }
          }
        }
      },
      presentacion: {
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
          noExiste: {
            enable: false
          },
          stringLength: {
            min: 3,
            message: "Ingrese más de 3 letras"
          },
          checkCanal: {
            message: "Seleccione un canal del Listado",
            callback: function(input) {
              const canalSelected = document
                .getElementById("frmVenta")
                .querySelector('[name="canalSelected"]').value;
              if (input == "" && canalSelected == "") {
                return true;
              } else {
                return input.value == canalSelected;
              }
            }
          }
        }
      },
      institucion: {
        validators: {
          noExiste: {
            enable: false
          },
          stringLength: {
            min: 3,
            message: "Ingrese más de 3 letras"
          },
          checkInstitucion: {
            message: "Seleccione una Institución del Listado",
            callback: function(input) {
              const institucionSelected = document
                .getElementById("frmVenta")
                .querySelector('[name="institucionSelected"]').value;
              if (input == "" && institucionSelected == "") {
                return true;
              } else {
                return input.value == institucionSelected;
              }
            }
          }
        }
      },
      f_receta: dateValidators,
      file_receta: fileValidators
    },
    plugins: {
      alias: new FormValidation.plugins.Alias({
        // These checkers are treated as callback validator
        checkMedico: "callback",
        checkInstitucion: "callback",
        checkCanal: "callback"
      }),
      trigger: new FormValidation.plugins.Trigger(),
      bulma: new FormValidation.plugins.Bulma(),
      submitButton: new FormValidation.plugins.SubmitButton(),
      icon: new FormValidation.plugins.Icon({
        valid: "fa fa-check",
        invalid: "invalid-fv fa fa-times",
        validating: "fa fa-refresh"
      })
    }
  })
    .on("core.field.invalid", function(e) {
      if (e == "file_receta") {
        $('i[data-field="file_receta"').removeClass("fa-times");
        $("#divFileReceta")
          .removeClass("is-info")
          .addClass("is-danger");
      }
      if (e == "file_otro") {
        $('i[data-field="file_otro"').removeClass("fa-times");
        $("#divFileOtro")
          .removeClass("is-info")
          .addClass("is-danger");
      }
    })
    .on("core.field.valid", function(e) {
      if (e == "file_receta") {
        $('i[data-field="file_receta"').removeClass("fa-check");
        $("#iconReceta")
          .removeClass("fa-upload")
          .addClass("fa-check");
        $("#divFileReceta")
          .removeClass("is-danger")
          .addClass("is-success");
      }
      if (e == "file_otro") {
        $('i[data-field="file_otro"').removeClass("fa-check");
        $("#iconFileOtro")
          .removeClass("fa-upload")
          .addClass("fa-check");
        $("#divFileOtro")
          .removeClass("is-danger")
          .addClass("is-success");
      }
    })
    .on("core.form.valid", function() {
      $("#divFileReceta")
        .removeClass("is-danger")
        .addClass("is-succes");
      if ($("file_otro" !== "")) {
        $("#divFileReceta")
          .removeClass("is-danger")
          .addClass("is-succes");
      }
      l_generar_venta();
    })
    .on("core.field.added", function(e) {});

  $("#btnAddDoc").click(function(e) {
    $("#divOtroDocumento").show();
    $("#divAddDoc").hide();
    fv.addField("f_otro", dateValidators).addField("file_otro", fileValidators);
  });
  $("#f_otro").change(function() {
    fv.revalidateField("f_otro");
  });
  $("#file_otro").change(function() {
    fv.revalidateField("file_otro");
  });

  $("#btnRemDoc").click(function(e) {
    $("#divOtroDocumento").hide();
    $("#divAddDoc").show();
    fv.removeField("f_otro", dateValidators).removeField(
      "file_otro",
      fileValidators
    );
  });
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
          fv.disableValidator("medico", "noExiste").revalidateField("medico");
          $.each(data, function(key, val) {
            if (val.text.search(regex) != -1) {
              output += `<a class="list-item" id="span_medico" name="span_medico" data-id="${val.id}">${val.text}`;
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
          fv.enableValidator("medico", "noExiste").revalidateField("medico");
          $("#helpMedico").html("");
          $("#result_medicos").html("");
        }
      });
    } else {
      if (searchField.length < minlength) {
        $("#result_medicos").html("");
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
    $("#medicoSelected").val(n_medico);
    if ($("#medico").val() == n_medico) {
      fv.disableValidator("medico", "noExiste").revalidateField("medico");
      $("#helpMedico").html("");
    } else {
      fv.enableValidator("medico", "noExiste").revalidateField("medico");
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
          fv.disableValidator("canal", "noExiste").revalidateField("canal");
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
          fv.enableValidator("canal", "noExiste").revalidateField("canal");
          $("#result_canal").html("");
          $("#helpCanal").html("");
          $("#helpCanal").removeClass("is-success");
          $("#helpCanal").addClass("is-danger");
          $("#helpCanal").html("");
        }
      });
    } else {
      if (searchField.length + 1 < minlength) {
        $("#result_canal").html("");
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
    $("#canalSelected").val(n_canal);
    if ($("#canal").val() == n_canal) {
      fv.disableValidator("canal", "noExiste").revalidateField("canal");
      $("#helpCanal").html("");
    } else {
      fv.enableValidator("canal", "noExiste").revalidateField("canal");
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
          fv.disableValidator("institucion", "noExiste").revalidateField(
            "institucion"
          );
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
          fv.enableValidator("institucion", "noExiste").revalidateField(
            "institucion"
          );
          $("#result_institucion").html("");
          $("#helpInstitucion").html("");
          $("#helpInstitucion").removeClass("is-success");
          $("#helpInstitucion").addClass("is-danger");
        }
      });
    } else {
      if (searchField.length + 1 < minlength) {
        $("#result_institucion").html("");
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
    $("#institucionSelected").val(n_institucion);
    if ($("#institucion").val() == n_institucion) {
      fv.disableValidator("institucion", "noExiste").revalidateField(
        "institucion"
      );
      $("#helpInstitucion").html("");
    } else {
      fv.enableValidator("institucion", "noExiste").revalidateField(
        "institucion"
      );
    }
    $("#result_institucion").html("");
  });
}

function l_set_select_presentacion($producto) {
  $.getJSON(
    aplicacion + "/ajax/ajx.presentacion.php",
    { oper: "getPresentacion", producto: $producto },
    function(data) {
      var items = [];
      $.each(data, function(key, val) {
        items.push("<option value='" + val.id + "'>" + val.valor + "</option>");
      });
      $("#presentacion").append(items);
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
