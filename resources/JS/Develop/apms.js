/**
 * Created by jgallina on 06/05/2015.
 */
var aplicacion = getCurrentHostname() + "/" + getUrlHTTP();
$.getScript(aplicacion + "/resources/JS/funciones.min.js", function () {
  // script is now loaded and executed.
  // put your dependent JS here.
  $(document).ready(function () {
    $("#TBLAPM").dataTable({
      ajax: {
        url: aplicacion + "/ajax/ajx.apms.php",
        dataSrc: "data",
      },
      bPaginate: true,
      iDisplayLength: 10,
      autoWidth: false,
      sPaginationType: "full_numbers",
      processing: true,
      deferRender: true,
      sDom: '<"top"B>frt<"bottom"ip><"clear">',
      columns: [
        { data: "id", bSearchable: true, bVisible: false, sClass: "center" },
        {
          data: function (data, type, dataToSet) {
            return (
              "<b class='pointer' onclick='callAPM(" +
              data.id +
              ")' title='Editar " +
              data.nombre_completo +
              "'>" +
              data.nombre_completo +
              "</b>"
            );
          },
        },
        { data: "estado", bSearchable: true, sWidth: "3%", sClass: "center" },
        {
          data: function (data, type, dataToSet) {
            if (data.estado == "Inactivo") {
              return (
                "<button type='button' class='del_can btn btn-success text-center' title='Activar APM' style='margin-left: 13px;' onclick='reactAPM(" +
                data.id +
                ");'><i class='fa fa-undo'></i></button>"
              );
            } else {
              return (
                "<button type='button' class='del_can btn btn-danger' title='Desactivar APM' style='margin-left: 13px;' onclick='delAPM(" +
                data.id +
                ");'><i class='fa fa-ban'></i></button>"
              );
            }
          },
          sWidth: "1%",
        },
      ],
      buttons: [
        {
          extend: "copyHtml5",
          text: '<i class="fa fa-files-o" aria-hidden="true"></i> Copiar',
        },
        {
          extend: "print",
          text: '<i class="fa fa-print" aria-hidden="true"></i> Imprimir',
        },
        {
          extend: "excel",
          text: '<i class="fa fa-file-excel-o" aria-hidden="true"></i> Excel',
        },
      ],
      oLanguage: {
        sProcessing: "Procesando...",
        sLengthMenu: "Mostrar _MENU_ registros",
        sZeroRecords: "No se encontraron resultados",
        sEmptyTable: "Ningún dato disponible en esta tabla",
        sInfo:
          "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
        sInfoEmpty: "Mostrando registros del 0 al 0 de un total de 0 registros",
        sInfoFiltered: "(filtrado de un total de _MAX_ registros)",
        sInfoPostFix: "",
        sSearch: "Buscar:",
        sUrl: "",
        sInfoThousands: ",",
        sLoadingRecords: "Cargando...",
        oPaginate: {
          sFirst: "Primero",
          sLast: "Último",
          sNext: "Siguiente",
          sPrevious: "Anterior",
        },
        oAria: {
          sSortAscending:
            ": Activar para ordenar la columna de manera ascendente",
          sSortDescending:
            ": Activar para ordenar la columna de manera descendente",
        },
        buttons: {
          copyTitle: "Copiado al Portapapeles",
          copyKeys:
            "Presione <i>CRTL</i> ó <i>\u2318</i> + <i>C</i> para copiar la tabla en el documento que desee. <br><br>Para cancelar, haga click sobre este mensaje o presione la tecla ESC.",
          copySuccess: {
            _: "%d líneas copiadas",
            1: "1 línea copiada",
          },
        },
      },
    });
    //reloadTBLinitial()

    $("#win").window("close"); // close a window
    $("#newAPM").click(function () {
      $("#win").window("open"); // close a window
      $("#win_can").attr("src", aplicacion + "/administrador/apm.php");
    });
    $(".panel-tool-close").click(function () {
      reloadTBLinitial();
    });
  });
});

function reloadTBLinitial() {
  $("#DataAPM").html("");
  $("#DataAPM").load(aplicacion + "/ajax/ajx.apms.php");
  $("#url").val("");
}
function callAPM(id) {
  $("#win").window("open"); // close a window
  $("#win_can").attr("src", aplicacion + "/administrador/apm.php?id=" + id);
}
function delAPM(id) {
  if (confirm("¿Desea desactivar a este APM?")) {
    var parametros = {
      oper: "Eliminar",
      id: id,
    };
    $.ajax({
      url: aplicacion + "/ajax/ajx.apm_form.php",
      type: "POST",
      data: parametros,
      success: function (opciones) {
        if (opciones.indexOf("ERROR") != 0) {
          alert("Se desactivó correctamente");
          window.location.href = window.location.href;
          reloadTBLinitial();
        } else {
          alert(opciones);
        }
      },
    });
  }
}
function reactAPM(id) {
  if (confirm("¿Desea habilitar este APM?")) {
    var parametros = {
      oper: "Reactivar",
      id: id,
    };
    $.ajax({
      url: aplicacion + "/ajax/ajx.apm_form.php",
      type: "POST",
      data: parametros,
      success: function (opciones) {
        if (opciones.indexOf("ERROR") != 0) {
          alert("Se habilitó correctamente el APM");
          window.location.href = window.location.href;
          reloadTBLinitial();
        } else {
          alert(opciones);
        }
      },
    });
  }
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
