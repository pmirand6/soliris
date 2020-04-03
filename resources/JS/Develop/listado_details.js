/**
 * Created by jgallina on 30/04/2015.
 */

var aplicacion = getCurrentHostname() + "/" + getUrlHTTP();
$.getScript(aplicacion + "/resources/JS/funciones.min.js", function() {
  // script is now loaded and executed.
  // put your dependent JS here.
  $(document).ready(function() {
    const idPac = getQuerystring("id");
    var tableHVentas = $("#DataDetailsHVentas").DataTable({
      bPaginate: true,
      iDisplayLength: 10,
      sPaginationType: "full_numbers",
      processing: true,
      dataSrc: "data",
      sAjaxSource: aplicacion + "/ajax/ajx.listadoDetailsHV.php?ini=" + idPac,
      bAutoWidth: true,
      sDom: '<"top"B>frt<"bottom"ip><"clear">',
      deferRender: true,
      order: [[5, "desc"]],
      aoColumns: [
        { mData: "id", bSearchable: true, sWidth: "5%", sClass: "center" }, //0
        {
          mData: "medico_nombre",
          bSearchable: true,
          sWidth: "10%",
          sClass: "center"
        }, //1
        { mData: "edad", bSearchable: true, sWidth: "5%", sClass: "center" }, // 2
        {
          mData: "presentacion",
          bSearchable: true,
          sWidth: "5%",
          sClass: "center"
        }, // 3
        {
          mData: "unidades",
          bSearchable: true,
          sWidth: "5%",
          sClass: "center"
        }, // 4
        {
          mData: "fecha_venta",
          bSearchable: true,
          sWidth: "7%",
          sClass: "center"
        }, // 5
        {
          mData: "fecha_receta",
          bSearchable: true,
          sWidth: "7%",
          sClass: "center"
        }, // 6
        { mData: "canal", bSearchable: true, sWidth: "7%", sClass: "center" }, // 7
        {
          mData: "institucion",
          bSearchable: true,
          sWidth: "7%",
          sClass: "center"
        }, // 8
        { mData: "apm", bSearchable: true, sWidth: "10%", sClass: "center" }, // 9
        { mData: "estado", bSearchable: true, sWidth: "5%", sClass: "center" }, // 10
        {
          mData: "documentos",
          bSearchable: true,
          sWidth: "20%",
          sClass: "center"
        } // 11
      ],
      columnDefs: [
        {
          //funcion para obtener los iconos de estado en la columna 9
          render: function(dataRow, type, row) {
            let idVenta = row.id;
            let campo = '<ul class="docs">';
            if (dataRow == null) {
              dataRow = "Sin Documentación";
            }
            if (dataRow.indexOf(",") > -1) {
              var string = dataRow.split(",");
              campo = "";
              for (pos = 0; pos < string.length; pos++) {
                campo += l_docs_icon(string[pos], idVenta, idPac);
              }
            } else {
              campo += l_docs_icon(dataRow, idVenta);
            }
            return campo + "</ul>";
          },
          targets: [11],
          visible: true,
          searchable: false
        }
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
        }
      }
    });
    $("#DataDetailsHVentas").on("click", "tr", function() {
      let idVenta = tableHVentas.row(this).data().id;
      l_showVenta(idVenta);
    });
  });
});

// funcion que redirecciona a la modificacion de venta
function l_showVenta(idVenta) {
  $.post(aplicacion + "/ajax/ajx.control_modificacion_venta.php", {
    idVenta: idVenta,
    oper: "controlModicacionVenta"
  }).done(function(data) {
    
    if (data.length != 0 ) {
      $.map(JSON.parse(data), function(e, i) {
        console.log(e)
        if (e.mensaje == '1') {
          window.location.href = aplicacion + '/main/modificar_venta.php/?idVenta=' + idVenta;
        } else {
          Swal.fire({
            title: e.title,
            icon: "warning",
            html: e.text,
            showCloseButton: true,
            showCancelButton: true,
            confirmButtonText: "Mostrar Venta",
            cancelButtonText: "Cerrar"
          }).then(result => {
            if(result.value){
              window.location.href = aplicacion + '/main/modificar_venta.php/?idVenta=' + idVenta + '&read=true';
            } 
          });  
        }
        
      });
    }
  });
}

//FUNCION PARA ESTABLECER LOS ICONOS DE LOS DOCUMENTOS
function l_docs_icon(value, idVenta = null, idPac = null) {
  if (value.indexOf("Sin Documentación") == -1) {
    var dir =
      aplicacion +
      "/documentacion/venta/" +
      idPac +
      "/" +
      idVenta +
      "/" +
      value;
    var campo = value.split(".");

    var t_titulo = campo[0].split("_");
    var titulo = t_titulo[0];

    var ext = campo[campo.length - 1];
    var extension = ext.toLowerCase();

    var icon = "TBL TBL-file_extension_" + extension;

    var ret =
      '<a href="' +
      dir +
      '" target="_blank"><li class="btn btn-default" style="cursor:pointer;" title="' +
      titulo +
      '"><span class="' +
      icon +
      '" style="cursor:pointer;")"></span></li>';

    return ret;
  }

  return "Sin Documentación";
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

function sexo_icon(value) {
  var icon = "TBL TBL-" + value;
  return (
    '<div class="' +
    icon +
    '" title="' +
    value +
    '"><p class="hidden">' +
    value +
    "</p></div>"
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
