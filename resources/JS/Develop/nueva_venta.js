//VARIABLES GLOBALES
// FIXME VERIFICAR ESTA VARIABLE
var grupo_usuario = ""; //VARIABLE DE GRUPO DE USUARIO
var aplicacion = getCurrentHostname() + "/" + getUrlHTTP();
var idPac;

$.getScript(aplicacion + "/resources/JS/funciones.min.js", function () {
  $(document).ready(function () {
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
      onBeforeClose: function () {
        window.location.href = window.location.href;
      },
    });
    $(".panel-tool-close").click(function () {
      window.location.href = window.location.href;
    });

    l_set_table_pac();
  });
});

// FUNCION PARA CALCULAR LA EDAD DEL PACIENTE

function l_calcular_edad(fecha) {
  var array_fecha = fecha.split("/");
  todayDate = new Date();
  todayYear = todayDate.getFullYear();
  todayMonth = todayDate.getMonth();
  todayDay = todayDate.getDate();
  age = todayYear - array_fecha[2];
  return age;
}

function l_set_table_pac() {
  var table = $("#DataTPacientes").DataTable({
    bPaginate: true,
    iDisplayLength: 5,
    sPaginationType: "full_numbers",
    processing: true,
    dataSrc: "data",
    sAjaxSource: "../ajax/ajx.pacientes_venta.php",
    rowId: "id",
    autoWidth: false,
    sDom: '<"top"B>frt<"bottom"ip><"clear">',
    deferRender: true,
    aoColumns: [
      { data: "id" },
      { data: "paciente" },
      { data: "sexo" },
      {
        data: "fnac",
      },
      { data: "fnac" },
      {
        data: "patologia",
        bSearchable: true,
      },
      {
        data: "subPatologia",
      },
      { data: "fconsen" },
      { data: "estado" },
      {
        data: "sub-estado",
      },
      { data: "u_fecha_venta" },
      {
        data: "u_idVenta",
        visible: false,
      },
      {
        data: "u_venta_estado_id",
        visible: false,
      },
      {
        data: "u_venta_estado",
        visible: false,
      },
    ],
    columnDefs: [
      {
        //funcion para obtener los iconos de estado en la columna 10
        render: function (data, type, row) {
          return l_calcular_edad(data);
        },
        targets: [3],
        searchable: false,
      },
      {
        //funcion para obtener los iconos de estado en la columna 10
        render: function (data, type, row) {
          return iconos_sexo(data);
        },
        targets: [2],
        searchable: false,
      },
      {
        //funcion para obtener los iconos de estado en la columna 10
        render: function (data, type, row) {
          var datos = data;
          return iconos_estado(data);
        },
        targets: [8],
        searchable: false,
      },
    ],
    buttons: [
      {
        extend: "copyHtml5",
        text: '<i class="fa fa-files-o" aria-hidden="true"></i> Copiar',
        className: "button is-primary  is-rounded",
      },
      {
        extend: "print",
        text: '<i class="fa fa-print" aria-hidden="true"></i> Imprimir',
        className: "button is-primary  is-rounded",
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

  $("#DataTPacientes").on("click", "tr", function () {
    var id = table.row(this).id();
    var u_idVenta = table.row(this).data().u_idVenta;
    var u_venta_estado_id = table.row(this).data().u_venta_estado_id;
    if (u_idVenta !== null) {
      // Verifico que la venta no este bloqueada para modificación
      // En el caso de que no sea verdadero deberá devolver el mensaje
      // de la funcion l_showVenta

      l_showVenta(u_idVenta, u_venta_estado_id, id);
    } else {
      // redirecciono a la pagina de guardar_venta en el caso de que no tenga ventas
      // En estado NP
      window.location.href = aplicacion + "/main/generar_venta.php?idPac=" + id;
    }
  });
}

//Evaluacion si la venta esta bloqueada para una modificación
function l_showVenta(idVenta, estadoVenta, idPac) {
  $.post(aplicacion + "/ajax/ajx.control_modificacion_venta.php", {
    idVenta: idVenta,
    oper: "controlModicacionVenta",
  }).done(function (data) {
    console.log(data);
    if (data.length != 0) {
      $.map(JSON.parse(data), function (e) {
        switch (e.mensaje) {
          //El paciente no esta bloqueado por otro usuario
          case "1":
            //Se verifica el ultimo estado de la ultima venta del paciente
            // Si el estado es 22 devuelvo el mensaje
            if (estadoVenta == "22") {
              Swal.fire({
                title: "Paciente con venta pendiente",
                text:
                  "El paciente ya tiene una venta generada en estado pendiente de NP",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "Ver Venta",
                CancelButtonText: "Cancelar",
              }).then((result) => {
                if (result.value) {
                  window.location.href =
                    aplicacion +
                    "/main/modificar_venta.php?idVenta=" +
                    idVenta;
                }
              });
            } else {
              // redirecciono a la pagina de guardar_venta en el caso de que no tenga ventas
              // En estado NP
              window.location.href =
                aplicacion + "/main/generar_venta.php?idPac=" + idPac;
            }
            break;
          case "22":
            // El paciente tiene una venta bloqueada de modificacion por un usuario
            Swal.fire({
              title: e.title,
              icon: "warning",
              html: e.text,
              showCloseButton: true,
              showCancelButton: true,
              confirmButtonText: "Mostrar Venta",
              cancelButtonText: "Cerrar",
            }).then((result) => {
              if (result.value) {
                window.location.href =
                  aplicacion +
                  "/main/modificar_venta.php?idVenta=" +
                  idVenta +
                  "&read=true";
              }
            });
            break;
          case "23":
            //La ultima venta del paciente esta en NP entonces se puede crear una nueva venta
            window.location.href =
              aplicacion + "/main/generar_venta.php?idPac=" + idPac;
            break;
          default:
            break;
        }
      });
    }
  });
}

//FUNCION PARA ESTABLECER LOS ICONOS DE LOS ESTADOS
function iconos_estado(value) {
  var icon = "TBL TBL-" + value;
  return `<span class="icon">
      <i class='${icon}'></i>
    </span>`;
}

function iconos_sexo(value) {
  var icon = "TBL TBL-" + value;
  return `<span class="icon">
      <i class='${icon}'></i>
    </span>`;
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
