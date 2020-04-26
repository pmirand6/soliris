var aplicacion = getCurrentHostname() + "/" + getUrlHTTP();
$(document).ready(function() {
  $("#win").window({
    //data-options="modal:true, closed:true, minimizable:false, "
    modal: true,
    closed: true,
    minimizable: false,
    maximizable: false,
    title: "Editar Información",
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
  //$('#win').window('close');  // close a window

  $("#nwPac").click(function() {
    $("#win").window("open"); // close a window
    $("#win_pac").attr("src", aplicacion + "/administrador/paciente.php");
  });

  $(".iniciales").click(function() {
    var initial = $(this).attr("id");
    reloadTBLinitial(initial);
  });
  $(".panel-tool-close").click(function() {
    reloadTBLinitial($("#url").val());
  });

  $("#DataTPacientes").DataTable({
    bPaginate: true,
    iDisplayLength: 5,
    sPaginationType: "full_numbers",
    processing: true,
    sAjaxSource: "../ajax/ajx.pacientes.php",
    bAutoWidth: true,
    sDom: '<"top"B>frt<"bottom"ip><"clear">',
    deferRender: true,
    aoColumns: [
      { mData: "id", bSearchable: true, bVisible: true, sClass: "center" },
      { mData: "paciente", bSearchable: true, sWidth: "20%", sClass: "center" },
      { mData: "sexo", bSearchable: true, sWidth: "2%", sClass: "center" },
      { mData: "edad", bSearchable: true, sWidth: "3%", sClass: "center" },
      { mData: "fnac", bSearchable: true, sWidth: "10%", sClass: "center" },
      {
        mData: "patologia",
        bSearchable: true,
        sWidth: "20%",
        sClass: "center"
      },
      {
        mData: "subPatologia",
        bSearchable: true,
        sWidth: "20%",
        sClass: "center"
      },
      { mData: "fconsen", bSearchable: true, sWidth: "10%", sClass: "center" },
      { mData: "email", bSearchable: true, sWidth: "10%", sClass: "center" },
      { mData: "telefono", bSearchable: true, sWidth: "2%", sClass: "center" },
      { mData: "notas", bSearchable: true, sWidth: "5%", sClass: "center" },
      { mData: "estado", bSearchable: true, sWidth: "3%", sClass: "center" },
      {
        mData: "sub-estado",
        bSearchable: true,
        sWidth: "3%",
        sClass: "center"
      },
      { mData: "uventa", bSearchable: true, sWidth: "10%", sClass: "center" }
    ],
    buttons: [
      {
        extend: "copyHtml5",
        text: '<i class="fa fa-files-o" aria-hidden="true"></i> Copiar'
      },
      {
        extend: "print",
        text: '<i class="fa fa-print" aria-hidden="true"></i> Imprimir'
      },
      {
        extend: "excel",
        text: '<i class="fa fa-file-excel-o" aria-hidden="true"></i> Excel'
      }
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
        sPrevious: "Anterior"
      },
      oAria: {
        sSortAscending:
          ": Activar para ordenar la columna de manera ascendente",
        sSortDescending:
          ": Activar para ordenar la columna de manera descendente"
      },
      buttons: {
        copyTitle: "Copiado al Portapapeles",
        copyKeys:
          "Presione <i>CRTL</i> ó <i>\u2318</i> + <i>C</i> para copiar la tabla en el documento que desee. <br><br>Para cancelar, haga click sobre este mensaje o presione la tecla ESC.",
        copySuccess: {
          _: "%d líneas copiadas",
          1: "1 línea copiada"
        }
      }
    }
  });
});

function reloadTBLinitial(init) {
  $("#" + init).html('<span class="fa fa-spinner fa-pulse"></span>');
  if (init != "") {
    $.get(aplicacion + "/ajax/ajx.pacientes.php?ini=" + init, function(data) {
      doRefresh(data, "#DataTPacientes");
      $("#" + init).html(init);
    });
  } else {
    $.get(aplicacion + "/ajax/ajx.pacientes.php", function(data) {
      doRefresh(data, "#DataTPacientes");
      $("#" + init).html(init);
    });
  }
}
function doRefresh(data, id) {
  // data is a string
  data = jQuery.parseJSON(data);

  $(id)
    .dataTable()
    .fnClearTable();
  if (data.aaData.length)
    $(id)
      .dataTable()
      .fnAddData(data.aaData);
  $(id)
    .dataTable()
    .fnDraw();
}
function getData(idDest, aRow, id, nroCol) {
  if (
    $(id)
      .dataTable()
      .fnGetData(aRow) != "" ||
    nroCol != ""
  ) {
    $("#" + idDest).val(
      $(id)
        .dataTable()
        .fnGetData(aRow)[nroCol]
    );
  }
}
function callPac(id, grupo) {
  $("#win").window("open"); // close a window
  $("#win_pac").attr(
    "src",
    aplicacion + "/administrador/paciente.php?id=" + id
  );

  localStorage.removeItem("paramPaciente");
  const paramPaciente = {
    idPac: id
  };
  window.localStorage.setItem("paramPaciente", JSON.stringify(paramPaciente));
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
