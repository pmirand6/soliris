//VARIABLES GLOBALES
// FIXME VERIFICAR ESTA VARIABLE
var grupo_usuario = ""; //VARIABLE DE GRUPO DE USUARIO
var aplicacion = getCurrentHostname() + "/" + getUrlHTTP();
var idPac;

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

    l_set_table_pac();

    $('.dataTable').on('click', 'tbody td', function() {

      //get textContent of the TD
      console.log('TD cell textContent : ', this.textContent)
    
      //get the value of the TD using the API 
      //console.log('value by API : ', table.cell({ row: this.parentNode.rowIndex, column : this.cellIndex }).data());
    })

    $("#if_nv").load(function() {
      $("#if_nv").width("100%");
      $("#if_nv").height("100%");
    });

    $("#loading").hide();
    $("#DTlist").hide();
    $("#new-search").hide();

    $("#loading").hide(200);

    $("#nueva_venta").click(function() {
      $("#nv").window("open");
      $("#if_nv").attr(
        "src",
        aplicacion + "/main/informes_nue_pres.php?id=" + $("#pac").val()
      );
    });
  });
});
function l_load_prev_vent(id, id_paciente) {
  window.location.href =
    aplicacion +
    "/main/informes_nue_pres.php?id=" +
    id_paciente +
    "&idMst=" +
    id;
}

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
  $("#DataTPacientes").DataTable({
    bPaginate: true,
    iDisplayLength: 5,
    sPaginationType: "full_numbers",
    processing: true,
    dataSrc: "data",
    sAjaxSource: "../ajax/ajx.pacientes_venta.php",
    "autoWidth": false,
    sDom: '<"top"B>frt<"bottom"ip><"clear">',
    deferRender: true,
    aoColumns: [
      { data: "id" },
      { data: "paciente" },
      { data: "sexo" },
      {
        data: "fnac"
      },
      { data: "fnac" },
      {
        data: "patologia",
        bSearchable: true
      },
      {
        data: "subPatologia"
      },
      { data: "fconsen" },
      { data: "estado" },
      {
        data: "sub-estado"
      },
      { data: "uventa" }
    ],
    columnDefs: [
      {
        //funcion para obtener los iconos de estado en la columna 10
        render: function(data, type, row) {
          console.log(data);
          return l_calcular_edad(data);
        },
        targets: [3],
        searchable: false
      },
      {
        //funcion para obtener los iconos de estado en la columna 10
        render: function(data, type, row) {
          console.log(data);
          return iconos_sexo(data);
        },
        targets: [2],
        searchable: false
      },
      {
        //funcion para obtener los iconos de estado en la columna 10
        render: function(data, type, row) {
          var datos = data;
          return iconos_estado(data);
        },
        targets: [8],
        searchable: false
      }
    ],
    buttons: [
      {
        extend: "copyHtml5",
        text: '<i class="fa fa-files-o" aria-hidden="true"></i> Copiar',
        className: 'button is-primary  is-rounded'
      },
      {
        extend: "print",
        text: '<i class="fa fa-print" aria-hidden="true"></i> Imprimir',
        className: 'button is-primary  is-rounded'
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
}

function l_load_prev_vent() {}

function l_validate_form() {
  $(".form")
    .formValidation({
      framework: "bootstrap",
      excluded: ":disabled",
      fields: {
        paciente: {
          message: "Escriba un Paciente",
          validators: {
            notEmpty: {
              message: "Escriba un Paciente"
            }
          }
        }
      }
    })
    .on("success.form.fv", function(e) {
      // Se esconde el titulo de la seccion
      $("#titulo").hide();
      // Se deshabilita el input para elegir paciente
      $("#form-select :input").prop("disabled", true);
      // Se deshabilita el span del selector
      $("span.input-group-addon").css("pointer-events", "none");
      // Se muestra el boton de nueva busqueda y se habilita el boton
      $("#new-search").show();
      $("#new-search").removeAttr("disabled");
      // Se esconde el boton de buscar
      $("#buscar").hide();
      // Prevent form submission
      e.preventDefault();

      $("#loading").show(200);

      idPac = $("#paciente").val();
      $("#pac").val($("#paciente").val());

      $("#DTlist").show(300);
    })
    .submit(function(e) {
      e.preventDefault();
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

// Nueva Busqueda
$("#new-search").click(function(e) {
  e.preventDefault();

  // Escondemos las tablas
  $("#DTlist").hide();
  // Escondemos el boton de nueva busqueda
  $("#new-search").hide();
  // Se muestra el titulo de la seccion
  $("#titulo").show();
  // Se habilita el input para la busqueda
  $("#form-select :input").prop("disabled", false);
  // Se habilita el span del selector
  $("span.input-group-addon").css("pointer-events", "auto");
  // Se muestra el boton de busqueda y se habilita el boton
  $("#buscar").show();
  // Se refresca el form
  $("#form-select")[0].reset();
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
