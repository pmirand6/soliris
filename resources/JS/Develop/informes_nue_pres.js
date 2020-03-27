var inst_ok = 0;
var iSelected = "";
var aplicacion = getCurrentHostname() + "/" + getUrlHTTP();
$.getScript(aplicacion + "/resources/JS/funciones.min.js", function() {
  // script is now loaded and executed.
  // put your dependent JS here.
  $(document).ready(function() {
    var minlength = 1;
    var searchField = null;
    searchVal($("#inst").val());
    /* ********** Pre-Carga *********** */
    $("#inst").keyup(function() {
      var searchField = $("#inst").val();
      var regex = new RegExp(searchField, "i");
      var output = '<ul class="list-group">';
      var count = 1;
      var url_json = "../ajax/ajx.instituciones.php";
      if (searchField != null && searchField.length >= minlength) {
        $.getJSON(url_json, function(msg) {
          $.each(msg.data, function(key, val) {
            if (val.nombre.search(regex) != -1) {
              output += '<li class="list-group-item link-class">';
              output +=
                '<span class="text-muted" id="span_institucion" i_id="' +
                val.id +
                '">' +
                "<b>" +
                val.nombre +
                "</b>";
              if (count % 2 == 0) {
                output += "</span></li>";
              }
              count++;
            }
          });
          //output += '</div>';
          output += "</ul>";
          $("#result_instituciones").html(output);
        });
      } else {
        $("#result_instituciones").html("");
      }
    });

    $("#medico").select2({
      placeholder: "Seleccione un Médico",
      theme: "bootstrap",
      language: "es",
      minimumInputLength: 3,
      allowClear: true,
      ajax: {
        url: aplicacion + "/ajax/ajx.medicos.php",
        dataType: "json",
        delay: 250,
        delay: 250,
        data: function(params) {
          return {
            q: params.term, // search term
            page: params.page
          };
        },
        processResults: function(data) {
          return {
            results: data
          };
        },
        cache: true
      }
    }).change(function() {
      $(".form").formValidation("revalidateField", "medico");
    });

      
    $("#dosis")
      .combobox()
      .change(function() {
        $(".form").formValidation("revalidateField", "dosis");
      });
    $("#unidades")
      .combobox()
      .change(function() {
        $(".form").formValidation("revalidateField", "unidades");
      });
    $("#institucion")
      .combobox()
      .change(function() {
        $(".form").formValidation("revalidateField", "institucion");
      });
    $("#canal")
      .combobox()
      .change(function() {
        $(".form").formValidation("revalidateField", "canal");
      });

    /************************************/

    /********* DATATABLE ****************/
    // DATATABLES DE ULTIMAS VENTAS
    $("#UltVenTB").dataTable({
      ajax: {
        type: "POST",
        url: aplicacion + "/ajax/ajx.informes_ult_vent.php",
        dataSrc: "data",
        data: {
          id: getQuerystring("id")
        }
      },
      ordering: false,
      destroy: true,
      bFilter: false,
      bPaginate: true,
      iDisplayLength: 5,
      sPaginationType: "full_numbers",
      bAutoWidth: false,
      bLengthChange: false,
      deferRender: true,
      columns: [
        {
          data: function(data, type, dataToSet) {
            if (data.estado.indexOf("NP") == 0) {
              return data.id;
            } else {
              //$("#alerta").show();
              return "";
            }
          }
        }, // 0
        //{ "data": "fecha_venta"}, // 1
        {
          data: function(data, type, dataToSet) {
            if (data.estado.indexOf("NP") == 0) {
              return data.fecha_venta;
            } else {
              //$("#alerta").show();
              return "";
            }
          }
        }, // 1
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
            if (data.indexOf(";") > -1) {
              var string = data.split(";");
              var campo = "";
              for (pos = 0; pos < string.length; pos++) {
                campo += docs_icon(string[pos]);
              }
            } else {
              campo += docs_icon(data);
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
    /********* FIN DATABLE **************/
    $(".form")
      .formValidation({
        framework: "bootstrap",
        excluded: ":disabled",
        icon: {
          valid: "glyphicon glyphicon-ok",
          invalid: "glyphicon glyphicon-remove",
          validating: "glyphicon glyphicon-refresh"
        },
        fields: {
          patologia: {
            validators: {
              notEmpty: {
                message: "La patologia no puede quedar vacía"
              }
            }
          },
          dosis: {
            validators: {
              notEmpty: {
                message: "La dosis no puede quedar vacía"
              }
            }
          },
          unidades: {
            validators: {
              notEmpty: {
                message: "Las unidades no puede quedar vacías"
              }
            }
          },
          institucion: {
            validators: {
              notEmpty: {
                message: "La institución no puede quedar vacía"
              },
              callback: {
                message: "La institución no se encuentra registrada",
                callback: function(value, validator, $field) {
                  if (inst_ok === 1) {
                    return true;
                  } else {
                    return false;
                  }
                }
              }
            }
          },
          canal: {
            validators: {
              notEmpty: {
                message: "El canal no puede quedar vacío"
              }
            }
          },
          medico: {
            validators: {
              notEmpty: {
                message: "El médico no puede quedar vacío"
              }
            }
          }
        }
      })
      .on("success.form.fv", function(e) {
        // Prevent form submission
        e.preventDefault();
        $("#cargar_venta").attr("disabled", true);
        var TipoOper = getQuerystring("idMst");
        var msj;

        if (TipoOper != "") {
          // 'Modificar Venta'
          var parametros = {
            oper: "Mod_Venta",
            idMst: $("#idMst").val(),
            f_venta: $("#f_venta").val(),
            patologia: $("#patologia").val(),
            dosis: $("#dosis").val(),
            unidades: $("#unidades").val(),
            institucion: $("#id_institucion").val(),
            canal: $("#canal").val(),
            medico: $("#medico option:selected").attr("value")
          }; //"medico": $('#medico').val()
          msj = "El registro se modificó correctamente.";
        } else {
          // 'Nueva_Venta'
          var parametros = {
            oper: "Nueva_Venta",
            id_paciente: $("#id").val(),
            f_venta: $("#f_venta").val(),
            patologia: $("#patologia").val(),
            dosis: $("#dosis").val(),
            unidades: $("#unidades").val(),
            institucion: $("#id_institucion").val(),
            canal: $("#canal").val(),
            medico: $("#medico option:selected").attr("value")
          }; //"medico": $('#medico').val()
          msj = "El registro se generó correctamente.";
        }

        $.ajax({
          url: aplicacion + "/ajax/ajx.informe_nue_pres_form.php",
          type: "POST",
          data: parametros,
          success: function(opciones) {
            if (opciones.indexOf("ERROR") != 0) {
              alert(msj);
              window.location.href =
                aplicacion + "/main/informes_docs_nue_pres.php?id=" + opciones;
            } else {
              alert(opciones);
              $("#cargar_venta").attr("disabled", false);
            }
          },
          error: function() {
            alert("Ocurrió un Error con el envío de la información");
            $("#cargar_venta").attr("disabled", false);
          }
        });
      })
      .submit(function(e) {
        e.preventDefault();
      });
  });
  $(document).on("change", "#inst", function() {
    var inputInst = $("#inst").val();

    if (inputInst === iSelected) {
      inst_ok = 1;
      $(".form").formValidation("revalidateField", "institucion");
    } else {
      inst_ok = 0;
      $(".form").formValidation("revalidateField", "institucion");
    }
  });
  $(document).on("click", "#span_institucion", function() {
    iSelected = $(this).text();
    var inputInst = $("#inst").val();

    if (inputInst === iSelected) {
      inst_ok = 1;
      $(".form").formValidation("revalidateField", "institucion");
    }
    $("#result_instituciones").html("");
  });
});

$(document).on("click", "#span_institucion", function() {
  $("#inst").val($(this).text());
  $("#id_institucion").val($(this).attr("i_id"));
  $("#result_instituciones").html("");
});

function searchVal(val) {
  var searchField = val;
  var valido = "";
  var count = 1;
  var url_json = "../ajax/ajx.instituciones.php";
  $.getJSON(url_json, function(msg) {
    var json = msg.data;
    $.each(json, function(i, v) {
      if (v.nombre === searchField) {
        inst_ok = 1;
      }
    });
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
