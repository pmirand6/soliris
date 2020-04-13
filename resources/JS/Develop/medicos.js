var aplicacion = getCurrentHostname() + "/" + getUrlHTTP();
$(document).ready(function () {
  $("#win").window({
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
    onBeforeClose: function () {
      window.location.href = window.location.href;
    },
  });

  $("#nwMed").click(function () {
    $("#win").window("open"); // close a window
    $("#win_med").attr("src", aplicacion + "/administrador/medico.php");
  });
  $(".iniciales").click(function () {
    var initial = $(this).attr("id");
    reloadTBLinitial(initial);
  });
  $(".panel-tool-close").click(function () {
    reloadTBLinitial($("#url").val());
  });

  $("#DataTMedicos").dataTable({
    bPaginate: true,
    iDisplayLength: 5,
    sPaginationType: "full_numbers",
    processing: true,
    ajax: {
      url: aplicacion + '/ajax/ajx.medicos.php',
      type: "POST",
      data: {
        oper: 'getMedicos',
      }
    },
    sDom: '<"top"B>frt<"bottom"ip><"clear">',
    deferRender: true,
    autoWidth: false,
    order: [1, "asc"],
    aoColumns: [
      {
        mData: "id",
        bSearchable: true,
        bVisible: false,
        sClass: "center",
      },
      {
        mData: "medico",
        bSearchable: true,
        sWidth: "20%",
        sClass: "center",
      },
      {
        mData: "matricula",
        bSearchable: true,
        sWidth: "10%",
        sClass: "center",
      },
      {
        mData: "especialidad",
        bSearchable: true,
        sWidth: "10%",
        sClass: "center",
      },
      {
        mData: "catencion",
        bSearchable: true,
        sWidth: "20%",
        sClass: "center",
      },
      {
        mData: "tel",
        bSearchable: true,
        sWidth: "10%",
        sClass: "center",
      },
      {
        mData: "email",
        bSearchable: true,
        sWidth: "15%",
        sClass: "center",
      },
      {
        mData: "estado",
        bSearchable: true,
        sWidth: "3%",
        sClass: "center",
      },
      {
        mData: "f_cap",
        bSearchable: true,
        sWidth: "7%",
        sClass: "center",
      },
      {
        mData: "apm",
        bSearchable: true,
        sWidth: "15%",
        sClass: "center",
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
});

function reloadTBLinitial(init) {
  $("#" + init).html('<span class="fa fa-spinner fa-pulse"></span>');
  if (init != "") {
    $.get(aplicacion + "/ajax/ajx.medicos.php?ini=" + init, function (data) {
      doRefresh(data, "#DataTMedicos");
      $("#" + init).html(init);
    });
  } else {
    $.get(aplicacion + "/ajax/ajx.medicos.php", function (data) {
      doRefresh(data, "#DataTMedicos");
      $("#" + init).html(init);
    });
  }
}
function doRefresh(data, id) {
  // data is a string
  data = jQuery.parseJSON(data);

  $(id).dataTable().fnClearTable();
  if (data.aaData.length) $(id).dataTable().fnAddData(data.aaData);
  $(id).dataTable().fnDraw();
}
function getData(idDest, aRow, id, nroCol) {
  if ($(id).dataTable().fnGetData(aRow) != "" || nroCol != "") {
    $("#" + idDest).val($(id).dataTable().fnGetData(aRow)[nroCol]);
  }
}
function callMed(id) {
  $("#win").window("open"); // close a window
  $("#win_med").attr("src", aplicacion + "/administrador/medico.php?id=" + id);
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
