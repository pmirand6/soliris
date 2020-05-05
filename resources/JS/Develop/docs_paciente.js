/**
 * Created by jgallina on 20/04/2015.
 */
var aplicacion = getCurrentHostname() + "/" + getUrlHTTP();
var paramPaciente = JSON.parse(window.localStorage.getItem("paramPaciente"));
var flagDocumento;
var flagRespuesta = true;

$.getScript(aplicacion + "/resources/JS/funciones.min.js", function () {
  // script is now loaded and executed.
  // put your dependent JS here.

  $(document).ready(function () {
    $(".date").datepicker({
      format: "dd-mm-yyyy",
      language: "es",
      endDate: getDate(),
      calendarWeeks: true,
      autoclose: true,
      clearBtn: true,
      todayHighlight: true,
    });

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
          f_doc_vac: {
            validators: {
              date: {
                format: "DD-MM-YYYY",
                message: "El formato es invalido",
              },
              notEmpty: {
                message:
                  "La Fecha del Documento de vacunación no puede quedar vacía",
              },
            },
          },
        },
      })
      .on("success.form.fv", function (e) {
        e.preventDefault();
      })
      .submit(function (e) {
        Consentimiento.startUpload();
        Otro.startUpload();
        alert("Se cargo correctamente la documentación");
        window.location.href =
          aplicacion + "/administrador/pacientes.php?id=" + paramPaciente.idPac;
      });

    $("#f_doc_vac").on("change", function () {
      $(".form").formValidation("revalidateField", "f_doc_vac");
    });

    $("#f_doc_otro").on("change", function () {
      $(".form").formValidation("revalidateField", "f_doc_otro");
    });

    var Consentimiento = $("#file_consentimiento").uploadFile({
      url: aplicacion + "/ajax/ajx.docs_paciente.php",
      autoSubmit: false,
      dragDrop: false,
      fileName: "myfile",
      allowedTypes: "jpg,png,gif,doc,pdf,zip,bmp,tif",
      returnType: "json",
      dragDropStr: "<span><b>Arrastre y suelte el archivo...</b></span>",
      maxFileCount: 1,
      multiple: false,
      formData: {
        idPac: paramPaciente.idPac,
        referencia: "Paciente",
        tipoDoc: "Vacunacion",
        oper: "saveDocPac",
      },
      dynamicFormData: function () {
        var data = { f_doc_vac: getFechaValue("f_doc_vac") };
        return data;
      },
      onSubmit: function () {
        $(".form").formValidation("revalidateField", "f_doc_vac");
      },
      onSuccess: function (files, data, xhr) {
        //alert((paramPaciente.idPac));
        // $("#file_consentimiento").addClass("glyphicon glyphicon-ok");
        // ModifiedPac();
      },
      onError: function (files, status, errMsg, pd) {
        //files: list of files
        //status: error status
        //errMsg: error message
        alert(status + errMsg);
      },
    });
    var Otro = $("#file_otro").uploadFile({
      url: aplicacion + "/ajax/ajx.docs_paciente.php",
      autoSubmit: false,
      dragDrop: false,
      fileName: "myfile",
      allowedTypes: "jpg,png,gif,doc,pdf,zip,bmp,tif",
      returnType: "json",
      dragDropStr: "<span><b>Arrastre y suelte el archivo...</b></span>",
      multiple: false,
      maxFileCount: 1,
      formData: {
        idPac: paramPaciente.idPac,
        referencia: "Paciente",
        tipoDoc: "Otro",
        oper: "saveDocPac",
      },
      dynamicFormData: function () {
        var data = {
          f_doc_otro: getFechaValue("f_doc_otro"),
        };
        return data;
      },
      onSubmit: function () {
        $(".form").formValidation("addField", "f_doc_otro", {
          validators: {
            date: {
              format: "DD-MM-YYYY",
              message: "El formato es invalido",
            },
            notEmpty: {
              message: "La Fecha de este Documento no puede quedar vacía",
            },
          },
        });
      },
      onSuccess: function (files, data, xhr) {},
      onError: function (files, status, errMsg, pd) {
        //files: list of files
        //status: error status
        //errMsg: error message
        alert(status + errMsg);
      },
    });
    $("#save").click(function () {
      var $btn = $(this).button("loading");
      Consentimiento.startUpload();
      Otro.startUpload();
      alert("Se cargo correctamente la documentación");
      if (getQuerystring("accion") == "alta") {
        $.post(
          aplicacion + "/ajax/ajx.paciente.php",
          {
            oper: "sendEmailPaciente",
            idPac: paramPaciente.idPac,
            accion: "Alta de Paciente",
          },
          function (data, textStatus, jqXHR) {},
          "dataType"
        );
      }

      window.location.href =
        aplicacion + "/administrador/pacientes.php?id=" + paramPaciente.idPac;
      $btn.button("reset");
    });

    $("#Docs").click(function () {
      if (getQuerystring("id") != "") {
        var $btn = $(this).button("loading");
        window.location.href =
          aplicacion + "/administrador/paciente.php?id=" + paramPaciente.idPac;
        $btn.button("reset");
      }
    });
  });
});

// Documentacion Paciente modificado se debe actualizar el estado a Pendiente
// para que sea revisada la documentacion por FV

function DocPacModified() {
  var parametros = {
    oper: "DocPacModified",
    id: $("#id").val(),
  };
  $.ajax({
    url: aplicacion + "/ajax/ajx.docs_paciente.php",
    type: "POST",
    data: parametros,
    async: false,
    success: function (opciones) {
      if (opciones.indexOf("ERROR") != 0) {
        alert("Se registró correctamente, ya puede cerrar esta ventana");
        $.post(
          aplicacion + "/ajax/ajx.paciente.php",
          {
            oper: "sendEmailPaciente",
            idPac: $("#id").val(),
            accion: "Paciente Modificado",
          },
          function (data, textStatus, jqXHR) {},
          "dataType"
        );
        setTimeout(function () {
          window.location.href =
            aplicacion + "/administrador/docs_paciente.php?id=" + opciones;
        }, 3000);
      } else {
        alert(opciones);
      }
    },
  });
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

function getFechaValue($id) {
  return $("#" + $id + "").val();
}

function getQuerystring(key, default_) {
  if (default_ == null) default_ = "";
  key = key.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
  var regex = new RegExp("[\\?&]" + key + "=([^&#]*)");
  var qs = regex.exec(window.location.href);
  if (qs == null) return default_;
  else return qs[1];
}
