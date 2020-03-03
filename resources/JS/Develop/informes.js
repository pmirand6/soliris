//VARIABLES GLOBALES

var grupo_usuario = ""; //VARIABLE DE GRUPO DE USUARIO
var aplicacion = getCurrentHostname() + '/' + getUrlHTTP();

$.getScript(
  aplicacion + "/resources/JS/funciones.min.js",
  function() {
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

      $("#if_nv").load(function() {
        $("#if_nv").width("100%");
        $("#if_nv").height("100%");
        });

      $("#loading").hide();
      $("#DTlist").hide();
      $("#new-search").hide();
        
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

                var idPac;
          idPac = $("#paciente").val();
          $("#pac").val($("#paciente").val());

          $("#DTlist").show(300);
                
          //$('#PacDat').load(getCurrentHostname() + '/ajax/ajx.informes_dat_pac.php?id=' + idPac);
          //$('#UltVen').load(getCurrentHostname() + '/ajax/ajx.informes_ult_vent.php?id=' + idPac);

                // DATATABLES DATOS PACIENTE
                $("#PacDat").dataTable( {
            ajax: {
              url:
                aplicacion +
                "/ajax/ajx.informes_dat_pac.php?id=" +
                idPac,
              dataSrc: "data"
                    },
            destroy: true,
            bPaginate: true,
            iDisplayLength: 5,
            sPaginationType: "full_numbers",
            bAutoWidth: true,
                    //"sDom": '<"top"B>frt<"bottom"ip><"clear">',
            dom: '<"top"B>rt<"bottom"ip><"clear">',
            deferRender: true,
            columns: [
              { data: "Nombre" }, // 0
              { data: "sexo" }, // 1
              { data: "c_gestar" }, // 2
              { data: "f_nac" }, // 3
              { data: "edad" }, // 4
              { data: "patologia" }, // 5
              { data: "estado" }, // 6
              { data: "documentos" } // 7
                    ],
            columnDefs: [
                    {   
                            //funcion para obtener los iconos de estado en la columna 10
                render: function(data, type, row) {
                                var datos = data;
                                return estado_icon(data);
                            },
                targets: [6],
                searchable: false
                        },
                        {      
                            //funcion para obtener los iconos de documentos en la columna 10
                render: function(data, type, row) {
                                campo = '<ul class="docs">';
                  if (data === null) {
                    data = "Sin Documentación";
                  }
                  if (data.indexOf(";") > -1) {
                                    var string = data.split(";");
                    var campo = "";
                                    for (pos=0; pos < string.length; pos++){
                                        campo+= docs_icon(string[pos]);
                                    }
                                } else {
                                    campo += docs_icon(data);    
                                }
                  return campo + "</ul>";
                            },
                targets: [7],
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
                text:
                  '<i class="fa fa-file-excel-o" aria-hidden="true"></i> Excel'
              }
                        ],
            oLanguage: {
              sSearch: "Filtrar:",
              sLengthMenu: "Mostrar _MENU_ registros",
              oPaginate: {
                sFirst: "Primero",
                sPrevious: "Anterior",
                sNext: "Siguiente",
                sLast: "Último"
                            },
              sEmptyTable: "No se encontraron registros",
              sZeroRecords: "No se encontraron registros",
              sInfo:
                "Mostrando (_START_ a _END_ registro/s). Total de registro/s: _TOTAL_ ",
              sInfoEmpty: "No se encontraron registros",
              sProcessing: "Procesando",
              sInfoFiltered: "(Filtrados de un total de _TOTAL_ registros)",
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

                // DATATABLES DE ULTIMAS VENTAS
                $("#UltVenTB").dataTable( {
            ajax: {
              url:
                aplicacion +
                "/ajax/ajx.informes_ult_vent.php?id=" +
                idPac,
              dataSrc: "data"
                    },
            ordering: false,
            destroy: true,
            bPaginate: true,
            iDisplayLength: 5,
            sPaginationType: "full_numbers",
            bAutoWidth: true,
                    //"sDom": '<"top"B>frt<"bottom"ip><"clear">',
            dom: '<"top"B>rt<"bottom"ip><"clear">',
            deferRender: true,
            columns: [
              {
                data: function(data, type, dataToSet) {
                        if (data.estado.indexOf("NP") == 0) {
                            return data.id;
                        } else {
                            return "";
                        }
                }
              }, // 0
              { data: "fecha_venta" }, // 1
              { data: "fecha_receta" }, // 2
              { data: "consentimiento" }, // 3
              { data: "dosis" }, // 4
              { data: "unidades" }, // 5
              { data: "medico" }, // 6
              { data: "institucion" }, // 7
              { data: "canal" }, // 8
              { data: "APM" }, // 9
              { data: "estado" }, // 10
              { data: "documentos" } // 11
                    ],
            columnDefs: [
                    {   
                            //funcion para obtener los iconos de estado en la columna 10
                render: function(data, type, row) {
                                var datos = data;
                                return estado_icon(data);
                            },
                targets: [10],
                searchable: false
                        },
                        {      
                            //funcion para obtener los iconos de estado en la columna 10
                render: function(data, type, row) {
                                campo = '<ul class="docs">';
                  if (data !== null) {
                    if (data.indexOf(";") > -1) {
                                    var string = data.split(";");
                      var campo = "";
                                    for (pos=0; pos < string.length; pos++){
                                        campo+= docs_icon(string[pos]);
                                    }
                                } else {
                      if (data !== null && data !== undefined) {
                                    campo += docs_icon(data);    
                                }
                    }    
                  }
                  
                  return campo + "</ul>";
                            },
                targets: [11],
                visible: true,
                searchable: false
                        },
                        {
                            //funcion para obtener los iconos de estado en la columna 8
                targets: [10],
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
                text:
                  '<i class="fa fa-file-excel-o" aria-hidden="true"></i> Excel'
              }
                        ],
            oLanguage: {
              sSearch: "Filtrar:",
              sLengthMenu: "Mostrar _MENU_ registros",
              oPaginate: {
                sFirst: "Primero",
                sPrevious: "Anterior",
                sNext: "Siguiente",
                sLast: "Último"
                            },
              sEmptyTable: "No se encontraron registros",
              sZeroRecords: "No se encontraron registros",
              sInfo:
                "Mostrando (_START_ a _END_ registro/s). Total de registro/s: _TOTAL_ ",
              sInfoEmpty: "No se encontraron registros",
              sProcessing: "Procesando",
              sInfoFiltered: "(Filtrados de un total de _TOTAL_ registros)",
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

          $("#loading").hide(200);
})
.submit(function(e){
    e.preventDefault();
});

/* Cargo el combobox de Pacientes */
      $("#paciente")
.combobox()
.change(function () {
          $(".form").formValidation("revalidateField", "paciente");
});

      $("#nueva_venta").click(function() {
        $("#nv").window("open");
        $("#if_nv").attr(
          "src",
          aplicacion +
            "/main/informes_nue_pres.php?id=" +
            $("#pac").val()
        );
});
});
  }
);
function l_load_prev_vent(id, id_paciente){
  window.location.href =
    aplicacion +
    "/main/informes_nue_pres.php?id=" +
    id_paciente +
    "&idMst=" +
    id;
}

//FUNCION PARA ESTABLECER LOS ICONOS DE LOS DOCUMENTOS
function docs_icon(value){
  if ((value.indexOf("Sin Documentación") == -1)) {
    var dir = aplicacion + "/documentacion/" + value;
    var campo = value.split(".");

    var t_titulo = campo[0].split("_");
        var titulo=t_titulo[0];

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
function estado_icon(value){
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

function sexo_icon(value){
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

function getCurrentHostname(){
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