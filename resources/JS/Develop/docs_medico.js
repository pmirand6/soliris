/**
 * Created by jgallina on 20/04/2015.
 */
var aplicacion = getCurrentHostname() + "/" + getUrlHTTP();
$.getScript(aplicacion + "/resources/JS/funciones.min.js", function () {
  // script is now loaded and executed.
  // put your dependent JS here.
  $(document).ready(function () {
    $("#bot_guardar").attr("disabled", true);
    $(".date").datepicker({
      format: "dd/mm/yyyy",
      language: "es",
      endDate: getDate(),
      calendarWeeks: true,
      autoclose: true,
      clearBtn: true,
      todayHighlight: true,
    });

    $("#frmDocsMedico")
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
          fecha: {
            validators: {
              date: {
                format: "DD/MM/YYYY",
                message: "El formato es invalido",
              },
              notEmpty: {
                message:
                  "La Fecha del Documento de capacitación no puede quedar vacía",
              },
            },
          },
        },
      })
      .on("success.form.fv", function (e) {
        e.preventDefault();
        if ($(".ajax-file-upload-filename").val() == undefined) {
          alert("Debe Seleccionar un documento");
        } else {
          Capacitacion.startUpload();
          alert("Se cargo correctamente la documentación");
          window.location.href = aplicacion + "/administrador/medicos.php";
        }
      })
      .submit(function (e) {
        e.preventDefault();
      });

    $("#fecha").change(function () {
      $(".form").formValidation("revalidateField", "fecha");
    });

    var Capacitacion = $("#Capacitacion").uploadFile({
      url: aplicacion + "/ajax/ajx.docs_medico.php",
      dragDrop: false,
      showFileCounter: true,
      fileName: "file_capacitacion",
      autoSubmit: false,
      allowedTypes: "jpg,png,gif,doc,pdf,zip,bmp,tif",
      returnType: "json",
      maxFileCount: 1,
      formData: {
        idMedico: $("#id").val(),
      },
      onSelect: function (files) {
        files[0].name;
        files[0].size;
        $("#bot_guardar").attr("disabled", false);
        return true; //to allow file submission.
      },
      dynamicFormData: function () {
        var data = { fecha_capacitacion: $("#fecha").val() };
        return data;
      },
    });

    Capacitacion.change(function () {
        $('#bot_guardar').removeClass('disabled')
    });

    $("#back").click(function () {
      if (getQuerystring("id") !== "") {
        var $btn = $(this).button("loading");
        window.location.href =
          aplicacion + "/administrador/medico.php?id=" + getQuerystring("id");
        $btn.button("reset");
      }
    });
    /*$("#save").click(function () {
      var $btn = $(this).button("loading");
      Capacitacion.startUpload();
      $btn.button("reset");
      wait(3000);
      alert("Se registró correctamente, ya puede cerrar esta ventana");
      //window.location.href = aplicacion + '/administrador/medicos.php';
    });*/
    $("#Docs").click(function () {
      if (getQuerystring("id") !== "") {
        var $btn = $(this).button("loading");
        window.location.href =
          aplicacion + "/administrador/medico.php?id=" + getQuerystring("id");
        $btn.button("reset");
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
