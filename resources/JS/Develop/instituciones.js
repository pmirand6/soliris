/**
 * Created by jgallina on 06/05/2015.
 */
var aplicacion = getCurrentHostname() + "/" + getUrlHTTP();
$(document).ready(function () {
  $("#DataInstitucion").dataTable({
    ajax: {
      url: aplicacion + "/ajax/ajx.instituciones.php",
      dataSrc: "data",
      data: {
        oper: "listInstituciones",
      },
      type: "POST",
    },
    bPaginate: true,
    iDisplayLength: 10,
    sPaginationType: "full_numbers",
    processing: true,
    deferRender: true,
    sDom: '<"top"B>frt<"bottom"ip><"clear">',
    aoColumns: [
      { data: "id", bSearchable: true, bVisible: false, sClass: "center" }, // 0
      {
        data: function (data, type, dataToSet) {
          // 1
          return (
            "<b class='pointer' onclick='callInst(" +
            data.id +
            ");'>" +
            data.nombre +
            "</b>"
          );
        },
        sWidth: "50%",
        sClass: "center",
      },
      { data: "direccion", bSearchable: true, sWidth: "30%", sClass: "center" }, // 2
      { data: "altura", bSearchable: true, sWidth: "10%", sClass: "center" }, // 3
      { data: "localidad", bSearchable: true, sWidth: "15%", sClass: "center" }, // 4
      { data: "provincia", bSearchable: true, sWidth: "5%", sClass: "center" }, // 5
      { data: "tipo", bSearchable: true, sWidth: "5%", sClass: "center" }, // 6
      { data: "estado", bSearchable: true, sWidth: "5%", sClass: "center" }, // 7
      { data: "familia", bSearchable: true, sWidth: "5%", sClass: "center" }, // 8
      {
        data: function (data, type, dataToSet) {
          return (
            "<button type='button' class='del_inst btn btn-danger' title='Eliminar' style='margin-left: 13px;' onclick='delInst(" +
            data.id +
            ', "' +
            data.nombre +
            "\");'><i class='fa fa-trash-o'></i></button>"
          );
        },
      }, // 9
    ],
    columnDefs: [
      {
        // funcion para obtener el icono del sexo
        render: function (data, type, row) {
          var datos = data;
          return estado_icon(data);
        },
        targets: [7],
        searchable: false,
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

  //reloadTBLinitial('')

  $("#win").window({
    modal: true,
    closed: true,
    minimizable: false,
    maximizable: false,
    title: "Editar Institución",
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
  $("#newInst").click(function () {
    $("#win").window("open"); // close a window
    $("#win_inst").attr("src", aplicacion + "/administrador/institucion.php");
  });

  $(".panel-tool-close").click(function () {
    reloadTBLinitial($("#url").val());
  });
});

/* function reloadTBLinitial(){
    $('#DataInst').html('');
    $('#DataInst').load(getCurrentHostname() + '/ajax/ajx.instituciones.php');
    $('#url').val('');
}*/

function callInst(id) {
  $("#win").window("open"); // close a window
  $("#win_inst").attr(
    "src",
    aplicacion + "/administrador/institucion.php?id=" + id
  );
}

function delInst(id, nombre) {
  var str = "¿Desea eliminar la institucion " + nombre + "?";

  if (confirm(str)) {
    var parametros = {
      oper: "Eliminar",
      id: id,
    };
    $.ajax({
      url: aplicacion + "/ajax/ajx.institucion_form.php",
      type: "POST",
      data: parametros,
      success: function (opciones) {
        if (opciones.indexOf("ERROR") != 0) {
          alert("Se eliminó la Institución " + nombre);
          //window.location.href = window.location.href;
          location.reload();
        } else {
          alert(opciones);
        }
      },
    });
  }
}

//FUNCION PARA ESTABLECER LOS ICONOS DE LOS ESTADOS
function estado_icon(value) {
  var icon = "TBL TBL-" + value;
  return (
    '<samp class="' +
    icon +
    '" title="' +
    value +
    '"><p class="hidden ">' +
    value +
    "</p></samp>"
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
