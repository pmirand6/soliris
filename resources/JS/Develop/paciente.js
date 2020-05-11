var aplicacion = getCurrentHostname() + "/" + getUrlHTTP();
var paramPaciente = JSON.parse(window.localStorage.getItem("paramPaciente"));
var usuario = JSON.parse(window.localStorage.getItem("usuario"));

$.getScript(aplicacion + "/resources/JS/funciones.min.js", function () {
  // script is now loaded and executed.
  // put your dependent JS here.

  $(document).ready(function () {
    l_set_dom();

    $.fn.ajaxSelectPicker.locale["es-ES"] = {
      currentlySelected: "Seleccionado",
      emptyTitle: "Seleccione y comience a escribir",
      errorText: "No se puede recuperar resultados",
      searchPlaceholder: "Buscar...",
      statusInitialized: "Empieza a escribir una consulta de búsqueda",
      statusNoResults: "Sin Resultados",
      statusSearching: "Buscando...",
      statusTooShort: "Introduzca más caracteres",
    };

    $.fn.ajaxSelectPicker.locale.es = $.fn.ajaxSelectPicker.locale["es-ES"];

    $(".date").datepicker({
      format: "dd-mm-yyyy",
      language: "es",
      endDate: getDate(),
      calendarWeeks: true,
      autoclose: true,
      clearBtn: true,
      todayHighlight: true,
    });

    $("#patologia").on("changed.bs.select", function (
      e,
      clickedIndex,
      isSelected,
      previousValue
    ) {
      l_hide_selectpicker_sub_pat();
      l_list_sub_patologia(
        null,
        this.value,
        $("#patologia option:selected").text()
      );
    });

    if (getQuerystring("id") === "") {
      document.getElementById("masculino").checked = true;
    } else {
      $("#bot_guardar").removeClass("disabled");
    }

    $("#f_nac").on("change", function () {
      $("#f_edad").val(l_calcular_edad(this.value));
      $(".form").formValidation("revalidateField", "f_nac");
    });

    $("#editDocs").click(function () {
      window.location.href =
        aplicacion +
        "/administrador/docs_paciente.php?id=" +
        getQuerystring("id");
    });
    $("#histDocs").click(function () {
      window.location.href =
        "../vistas/paciente/docs_hist_paciente.php?id=" +
        getQuerystring("id") +
        "&nombre=" +
        ($("#apellido").val() + ", " + $("#nombre").val());
    });
    $("#confirmar_pac").click(function (e) {
      e.preventDefault();
      l_dictamen_paciente();
    });
  });
});

function l_dictamen_paciente() {
  var data = $("#frmDictamenPac").serializeArray();
  data.push({ name: "oper", value: "ValidaPac" });
  data.push({
    name: "idPac",
    value: document.getElementById("idPac").innerHTML,
  });

  $.post("../ajax/ajx.paciente_form.php", data, function (data) {
    l_mail_dictamenPaciente(document.getElementById("idPac").innerHTML);
    window.location.href = aplicacion + "/main/panel.php";
  });
}

function l_set_paciente() {
  $.ajax({
    type: "POST",
    url: "../ajax/ajx.paciente.php",
    data: { id: getQuerystring("id"), oper: "showPaciente" },
    success: function (response) {
      $.map($.parseJSON(response), function (e, i) {
        if (usuario.grupo == "fv" || usuario.grupo == "admin") {
          $("#nombrePac").html(e.apellido + " " + e.nombre);
          $("#apellido").val(e.apellido);
          $("#nombre").val(e.nombre);
          $("#idPac").html(e.id);
          $("#estadoPac").html(e.estado_valor);
          l_set_hero_style(e.estado_id);
          l_sub_estado(e.sub_estado_id);
          $("#fechaNacPac").html(e.fecha_nac_formateada);
          $("#f_edad").html(l_calcular_edad(e.fecha_nac_formateada));
          e.telefono === "NULL"
            ? $("#telPac").html("-")
            : $("#telPac").html(e.telefono);
          e.ciudad == "NULL"
            ? $("#ciudadPac").html("-")
            : $("#ciudadPac").html(e.ciudad);
          $("#paisPac").html(e.pais_nombre);
          e.mail == "NULL"
            ? $("#emailPac").html("-")
            : $("#emailPac").html(e.mail);
          $("#sexoPac").html(e.sexo);
          $("#osPac").html(e.os_nombre);
          $("crmId").html(e.crm_id);
          $("#patPac").html(e.patologiaNombre);
          $("#subPatPac").html(e.subPatologiaNombre);
          $("#usuarioCreador").html(e.usuario_creador);
          $("#fechaCreacion").html(e.fecha_creacion);
          // Verifico si el usuario tiene notas creadas y las muestro
          // Sino no despliego el div de notas
          e.notas === ""
            ? l_estado_dictamen(e.estado_valor)
            : l_estado_dictamen(
                e.estado_valor,
                e.notas,
                e.usuario_mod,
                e.fecha_modificacion
              );
          l_list_estado(e.estado_id);
        } else {
          l_show_id(e.id);
          $("#idPac").html(e.id);
          $("#apellido").val(e.apellido);
          $("#nombre").val(e.nombre);
          $("#f_nac").val(e.fecha_nac_formateada);
          $("#f_edad").val(l_calcular_edad(e.fecha_nac_formateada));
          e.sexo == "M"
            ? $("#masculino").attr("checked", "checked")
            : $("#femenino").attr("checked", "checked");
          $("#telefono").val(e.telefono);
          $("#ciudad").val(e.ciudad);
          l_list_paises(true, e.pais_id, e.pais_nombre);
          $("#mail").val(e.mail);
          l_get_estado(e.estado_id);
          e.estado_id === "7"
            ? l_estado_dictamen(e.estado_valor)
            : l_estado_dictamen(e.estado_valor, e.notas, e.usuario_mod);
          l_sub_estado(e.sub_estado_id);
          l_list_patologias(e.patologia_id);
          e.sub_patologia_id !== "4"
            ? l_list_sub_patologia(e.sub_patologia_id, e.patologia_id, null)
            : $("#div-sub_pat").hide();
          l_list_os(true, e.os_id, e.os_nombre);
          $("#crm_id").val(e.crm_id);
        }
      });
    },
  });
}

function l_show_id($id) {
  $("#div_paciente_id").show();
  $("#vw_id").val($id);
}

function l_get_estado($estado_id) {
  $.getJSON("../ajax/ajx.estado.php", { oper: "getEstado" }, function (data) {
    $.map(data, function (e, i) {
      if ($estado_id == e.id) $("#estado").val(e.valor);
    });
  });
}

function openFile(e) {
  urlImagen = aplicacion + "/documentacion/" + e;

  window.open(urlImagen);
}

function l_set_hero_style($estado_id) {
  switch ($estado_id) {
    case "7":
      $class = "is-warning";
      break;
    case "11":
      $class = "is-success";
      break;
    case "12":
      $class = "is-danger";
      break;
    case "13":
      $class = "is-danger";
      break;
    default:
      break;
  }
  $("#heroHeadPac").addClass($class);
}

function l_estado_dictamen(
  $estadoValor,
  $notas = null,
  $usuario_mod,
  $fecha_modificacion
) {
  $("#estadoDictamen").show();
  $("#estado").prop("disabled", true);

  if (usuario.grupo === "fv" || usuario.grupo === "admin") {
    const content = `
        <nav class="level">
            <div class="level-item has-text-centered">
                <div>
                    <p class="heading">Ultima Nota</p>
                    <p class="subtitle">${$notas}</p>
                </div>
            </div>
        </nav>
        <br>
        <div class="container has-text-centered">
            <div class="tags has-addons are-small">
                <span class="tag is-dark">${$usuario_mod}</span>
                <span class="tag is-info">${$fecha_modificacion}</span>
            </div>
        </div>
        `;
    $notas === null ? "" : $("#ultimaNota").html(content);
  } else {
    switch ($estadoValor) {
      case "Pendiente":
        $class = "alert-warning";
        break;
      case "Aprobado":
        $class = "alert-success";
        break;
      case "Baja":
        $class = "alert-danger";
        break;
      case "Rechazado":
        $class = "alert-danger";
        break;
      default:
        $class = "alert-info";
        break;
    }
    const content = `
                <div class="alert ${$class}" role="alert">
                    <p>Paciente en estado: <b>"${$estadoValor}" </b></p>
                    ${$notas ? "<p>Motivo:<i> " + $notas + "</i></p>" : ""}
                    ${
                      $usuario_mod !== undefined
                        ? `<p>Nota creada por: <b>${$usuario_mod}</b></p>`
                        : ""
                    }
                </div>
        `;

    $("#estadoDictamen").html(content);
  }
}

function l_list_estado($estado_id) {
  $.getJSON("../ajax/ajx.estado.php", { oper: "getEstado" }, function (data) {
    $.map(data, function (e, i) {
      // NOTE se verifica que si el estado es sin Documentacion o Pendiente no pueda ser seleccionado
      if (e.id == "7" || e.id === "31") {
        $("#estadoList").append(
          "<option value=" + e.id + " disabled>" + e.valor + "</option>"
        );
      } else {
        $("#estadoList").append(
          "<option value=" + e.id + ">" + e.valor + "</option>"
        );
      }
      if (e.id == $estado_id) {
        $("#estadoList").selectpicker("val", e.id);
      }

      $("#estadoList").selectpicker("refresh");
    });
  });
}

function l_sub_estado($sub_estado_id) {
  $.getJSON("../ajax/ajx.sub_estado.php", { oper: "getSubEstado" }, function (
    data
  ) {
    $.map(data, function (e, i) {
      $("#sub_estado").append(
        "<option value=" + e.id + ">" + e.valor + "</option>"
      );
      $("#sub_estado").selectpicker("refresh");
      if (e.id === $sub_estado_id) {
        usuario.grupo === "fv" || usuario.grupo === "admin"
          ? $("#subEstadoPac").html(e.valor)
          : $("#sub_estado").selectpicker("val", e.valor);
      }
    });
  });
}

function l_calcular_edad(fecha) {
  /**The magic number: 31557600000 is 24 * 3600 * 365.25 * 1000 
   * Which is the length of a year, the length of a year is 365 days and 6 hours which is 0.25 day. 
   * In the end i floor the result which gives us the final age.
  https://stackoverflow.com/questions/4060004/calculate-age-given-the-birth-date-in-the-format-yyyymmdd
 */

  var array_fecha = fecha.split("-");
  let dateFormat = array_fecha[2] + "-" + array_fecha[1] + "-" + array_fecha[0];
  var birthday = +new Date(dateFormat);
  return ~~((Date.now() - birthday) / 31557600000);
}

function l_list_patologias($patologia_id = null) {
  $.getJSON("../ajax/ajx.patologia.php", { oper: "list_patologias" }, function (
    data
  ) {
    $.map(data, function (e, i) {
      $("#patologia").append(
        "<option value=" + e.id + ">" + e.patologia_nombre + "</option>"
      );
      $("#patologia").selectpicker("refresh");
      if (e.id == $patologia_id) {
        $("#patologia").selectpicker("val", e.id);
      }
    });
  });
}

function l_list_sub_patologia(
  $sub_patologia_id = null,
  $patologia_id,
  $patologia_nombre
) {
  $("#sub_patologia").empty();
  $("#sub_patologia").selectpicker("refresh");

  $.get(
    "../ajax/ajx.sub_patologia.php",
    { oper: "list_sub_patologia", patologia_id: $patologia_id },
    function (data) {
      if (data !== 0) {
        l_hide_selectpicker_sub_pat(false);
        $("#sub_patologia").append(
          '<option value="" selected >Seleccione una Sub Patología</option>'
        );
        $.map(data, function (e, i) {
          $("#sub_patologia").append(
            "<option data-subtext=" +
              $patologia_nombre +
              " value=" +
              e.id +
              ">" +
              e.sub_patologia_nombre +
              "</option>"
          );

          if ($sub_patologia_id == e.id) {
            $("#sub_patologia").selectpicker("val", e.id);
          }

          $("#sub_patologia").selectpicker("refresh");
        });
      }
    },
    "json"
  );
}

function l_hide_selectpicker_sub_pat(hide = true) {
  if (hide) {
    $("#div-sub_pat").hide();
  } else if (hide == false) {
    $("#div-sub_pat").show();
  }
}

function l_list_paises($filter = null, $pais_id = null, $pais_nombre = null) {
  $("#pais")
    .selectpicker()
    .ajaxSelectPicker({
      ajax: {
        // data source
        url: "../ajax/ajx.paises.php",
        // ajax type
        type: "POST",
        // data type
        dataType: "json",
        langCode: "es",
        // Use "{{{q}}}" as a placeholder and Ajax Bootstrap Select will
        // automatically replace it with the value of the search query.
        data: {
          q: "{{{q}}}",
        },
      },
      // function to preprocess JSON data
      preprocessData: function (data) {
        var i,
          l = data.length,
          array = [];
        if (l) {
          for (i = 0; i < l; i++) {
            array.push(
              $.extend(true, data[i], {
                text: data[i].nombre,
                value: data[i].id,
              })
            );
          }
        }
        // You must always return a valid array when processing data. The
        // data argument passed is a clone and cannot be modified directly.
        return array;
      },
    });
  if ($filter) {
    $("#pais.after-init")
      .append(
        '<option value="' +
          $pais_id +
          '" selected="selected">' +
          $pais_nombre +
          "</option>"
      )
      .selectpicker("refresh");
    $("#pais.after-init").trigger("change");
  } else {
    $("#pais.after-init")
      .append('<option value="13" selected="selected">Argentina</option>')
      .selectpicker("refresh");
    $("#pais.after-init").trigger("change");
  }
}

function l_list_os($filter = null, $os_id = null, $os_nombre) {
  $("#os")
    .selectpicker()
    .ajaxSelectPicker({
      ajax: {
        // data source
        url: "../ajax/ajx.os.php",
        // ajax type
        type: "POST",
        // data type
        dataType: "json",
        langCode: "es",
        // Use "{{{q}}}" as a placeholder and Ajax Bootstrap Select will
        // automatically replace it with the value of the search query.
        data: {
          q: "{{{q}}}",
        },
      },

      // function to preprocess JSON data
      preprocessData: function (data) {
        var i,
          l = data.length,
          array = [];
        if (l) {
          for (i = 0; i < l; i++) {
            array.push(
              $.extend(true, data[i], {
                text: data[i].nombre,
                value: data[i].id,
              })
            );
          }
        }
        // You must always return a valid array when processing data. The
        // data argument passed is a clone and cannot be modified directly.
        return array;
      },
    });
  if ($filter) {
    $("#os")
      .append(
        '<option value="' +
          $os_id +
          '" selected="selected">' +
          $os_nombre +
          "</option>"
      )
      .selectpicker("refresh");
    $("#os").trigger("change");
  }
}

function l_validate_form() {
  $(".form")
    .formValidation({
      framework: "bootstrap",
      excluded: ":disabled",
      icon: {
        required: "fa fa-asterisk",
        valid: "glyphicon glyphicon-ok",
        invalid: "glyphicon glyphicon-remove",
        validating: "glyphicon glyphicon-refresh",
      },
      fields: {
        nombre: {
          message: "El nombre del paciente no es válido",
          validators: {
            notEmpty: {
              message: "El nombre del paciente no puede quedar vacío",
            },
            regexp: {
              regexp: /^[a-zA-ZñÑáéíóúÁÉÍÓÚ\s]*$/,
              message: "Este campo debe contener solo letras.",
            },
            stringLength: {
              min: 1,
              max: 100,
              message:
                "El nombre del paciente debe contener como mínimo 1 y como máximo 100 letras",
            },
          },
        },
        apellido: {
          message: "El apellido del paciente no es válido",
          validators: {
            notEmpty: {
              message: "El apellido del paciente no puede quedar vacío",
            },
            regexp: {
              regexp: /^[a-zA-ZñÑáéíóúÁÉÍÓÚ\s]*$/,
              message: "Este campo debe contener solo letras.",
            },
            stringLength: {
              min: 1,
              max: 100,
              message:
                "El apellido del paciente debe contener como mínimo 1 y como máximo 100 letras",
            },
          },
        },
        ciudad: {
          message: "El nombre de la ciudad no es válida",
          validators: {
            regexp: {
              regexp: /^[0-9a-zA-ZñÑáéíóúÁÉÍÓÚ\s,]*$/,
              message: "Este campo debe contener solo letras y/o números.",
            },
            stringLength: {
              min: 4,
              max: 100,
              message:
                "Este campo debe contener como mínimo 4 y como máximo 100 letras",
            },
          },
        },
        sub_estado: {
          validators: {
            notEmpty: {
              message: "El Sub Estado del paciente no puede quedar vacío",
            },
          },
        },
        patologia: {
          validators: {
            notEmpty: {
              message: "La patologia del paciente no puede quedar vacía",
            },
          },
        },
        pais: {
          validators: {
            notEmpty: {
              message: "Debe seleccionar un país",
            },
          },
        },
        /*estadoVal: {
                    validators: {
                        notEmpty: {
                            message: 'Debe Seleccionar una Opción'
                        }
                    }                            
                },*/
        mail: {
          validators: {
            emailAddress: {
              message: "Por favor, ingrese una dirección de e-mail",
            },
            regexp: {
              regexp: /^\S+@\S+\.\S+$/,
              message: "El formato del e-mail no es válido",
            },
          },
        },
        f_nac: {
          validators: {
            date: {
              format: "DD-MM-YYYY",
              message: "El formato es invalido",
            },
            notEmpty: {
              message:
                "La Fecha de Nacimiento del paciente no puede quedar vacía",
            },
          },
        },
        telefono: {
          validators: {
            regexp: {
              regexp: /^[0-9 -]+$/,
              message:
                'Este campo debe contener solo números. Puede utilizar como separador el símbolo "-".',
            },
            stringLength: {
              min: 8,
              message: "El teléfono debe tener como mínimo 8 números",
            },
          },
        },
      },
    })
    .on("success.form.fv", function (e) {
      e.preventDefault();
      save_ventas();
    })
    .submit(function (e) {
      e.preventDefault();
    });
}

function l_set_dom() {
  l_validate_form();

  if (getQuerystring("id") === "") {
    l_list_patologias();
    l_hide_selectpicker_sub_pat();
    l_list_paises();
    l_list_os();
    l_sub_estado();
  } else {
    l_set_paciente();
  }
}

function save_ventas() {
  if (getQuerystring("id") === "") {
    l_savePac();
  } else {
    l_actualizaPac();
  }
}

function l_savePac() {
  var parametros = $("#frm-paciente").serializeArray();
  parametros.push({ name: "oper", value: "savePac" });
  $.ajax({
    url: aplicacion + "/ajax/ajx.paciente_form.php",
    type: "POST",
    data: parametros,
    async: false,
    success: function (opciones) {
      if (opciones.indexOf("ERROR") != 0) {
        Swal.fire({
          title: "Registro Correcto",
          text: "Debe realizar la carga de documentación del paciente",
          icon: "info",
          showCancelButton: true,
          allowOutsideClick: false,
          confirmButtonColor: "#3085d6",
          cancelButtonColor: "#d33",
          confirmButtonText: "Si",
          cancelButtonText: "No",
        }).then((result) => {
          if (result.value) {
            localStorage.removeItem("paramPaciente");
            const paramPaciente = {
              idPac: opciones,
            };
            window.localStorage.setItem(
              "paramPaciente",
              JSON.stringify(paramPaciente)
            );
            window.location.href =
              aplicacion +
              "/administrador/docs_paciente.php?id=" +
              opciones +
              "&accion=alta";
          } else {
            Swal.fire({
              title: "Paciente Creado Sin Documentación",
              text:
                "El paciente quedó en estado 'Sin Documentación' y no podrá ser utilizado en el sistema hasta que no se le cargue la documentación correspondiente",
              icon: "warning",
              allowOutsideClick: false,
              showCancelButton: false,
              confirmButtonColor: "#3085d6",
              confirmButtonText: "Ok",
            }).then((result) => {
              if (result.value) {
                parent.location.reload();
              }
            });
          }
        });
      } else {
        alert(opciones);
      }
    },
  });
}

/** Funcion que actualiza el paciente
 *
 * Esta funcion antes de realizar el post al backend
 * Solicita una nota que indique la modificación.
 * Esta nota luego será mostrada por el sistema
 * tanto en la dictaminacion del paciente como en el form de Atencion Paciente
 */
function l_actualizaPac() {
  const swalWithBootstrapButtons = Swal.mixin({
    customClass: {
      confirmButton: "btn btn-success",
      cancelButton: "btn btn-danger",
    },
    buttonsStyling: false,
  });
  swalWithBootstrapButtons
    .fire({
      title: "Comentario de Modificación",
      input: "textarea",
      icon: "info",
      text: "Debe indicar un comentario para ejecutar esta acción",
      allowOutsideClick: false,
      inputPlaceholder: "Ingrese un Comentario",
      inputAttributes: {
        "aria-label": "Ingrese un Comentario",
      },
      showCancelButton: true,
      confirmButtonText: "Guardar",
      cancelButtonText: "Cancelar",
      inputValidator: (value) => {
        if (!value) {
          return "Debe escribir un comentario";
        }
      },
    })
    .then((result) => {
      if (result.value) {
        var parametros = $("#frm-paciente").serializeArray();
        parametros.push({
          name: "idPac",
          value: document.getElementById("idPac").innerHTML,
        });
        parametros.push({ name: "oper", value: "actualizaPac" });
        parametros.push({ name: "notas", value: result.value });

        $.ajax({
          url: aplicacion + "/ajax/ajx.paciente_form.php",
          type: "POST",
          data: parametros,
          async: false,
          success: function (opciones) {
            if (opciones.indexOf("ERROR") != 0) {
              sendEmailPacienteModificado();
              Swal.fire({
                title:
                  "Actualización Correcta. Desea actualizar la documentación?",
                icon: "info",
                showCancelButton: true,
                allowOutsideClick: false,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "Si",
                cancelButtonText: "No",
              }).then((result) => {
                if (result.value) {
                  window.location.href =
                    aplicacion +
                    "/administrador/docs_paciente.php?id=" +
                    getQuerystring("id") +
                    "&accion=mod";
                } else {
                  Swal.fire({
                    title: "Registro Correcto",
                    text:
                      "El paciente será dictaminado por el área de FV. Hasta entonces, quedará en estado pendiente",
                    icon: "success",
                    allowOutsideClick: false,
                    showCancelButton: false,
                    confirmButtonColor: "#3085d6",
                    confirmButtonText: "Ok",
                  }).then((result) => {
                    if (result.value) {
                      parent.location.reload();
                    }
                  });
                }
              });
            } else {
              alert(opciones);
            }
          },
        });
      }
    });
}

function sendEmailPacienteModificado() {
  $.post(
    aplicacion + "/ajax/ajx.paciente.php",
    {
      oper: "sendEmailPaciente",
      idPac: document.getElementById("idPac").innerHTML,
      accion: "Modificacion Paciente",
    },
    function (data, textStatus, jqXHR) {},
    "dataType"
  );
}

function save_admin() {
  if (usuario.grupo == "fv") {
    var parametros = {
      oper: "ValidaPac",
      id: $("#id").val(),
      //"nombre": $('#nombre').val(),
      comentario: $("#comentario").val(),
      estado: $("#estadoVal").val(),
    };
    $.ajax({
      url: aplicacion + "/ajax/ajx.paciente_form.php",
      type: "POST",
      data: parametros,
      async: false,
      success: function (opciones) {
        if (opciones.indexOf("ERROR") != 0) {
          alert("Se registró correctamente.");
          l_mail_dictamenPaciente($("#id").val());
          window.location.href = aplicacion + "/main/panel.php";
        } else {
          alert(opciones);
        }
      },
    });
  } else {
    save_ventas();
  }
}

function l_mail_dictamenPaciente(idPac) {
  $.post(
    aplicacion + "/ajax/ajx.paciente.php",
    {
      oper: "sendEmailPaciente",
      idPac: idPac,
      accion: "Dictamen Paciente",
    },
    function (data, textStatus, jqXHR) {},
    "dataType"
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

function getQuerystring(key, default_) {
  if (default_ == null) default_ = "";
  key = key.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
  var regex = new RegExp("[\\?&]" + key + "=([^&#]*)");
  var qs = regex.exec(window.location.href);
  if (qs == null) return default_;
  else return qs[1];
}
