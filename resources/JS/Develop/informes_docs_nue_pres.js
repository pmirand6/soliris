/**   OBJETOS UPLOADFILE   */
var Otro = upOtro();
var Receta = upRec();
var Test_Embarazo = upTest();
/** ---------------------- */

var aplicacion = getCurrentHostname() + '/' + getUrlHTTP();

$.getScript(
  aplicacion + "/resources/JS/funciones.min.js",

  function() {
    $(document).ready(function() {
      /**    DATEPICKERS         */
      var dpFrec = setDpRec();
      var dpTest = setDpTest();
      var dpOtro = setDpOtro();
      /** ---------------------- */

      Otro.hide();
      Receta.hide();
      Test_Embarazo.hide();

      getDocs();

        $("#tbl_ventas").hide();
      $(".save").hide();
      $(".change").hide();
      $("#fin_venta").attr("disabled", true);

        if (c_gestar_val == "SI"){
            var antiguedadRec = 14;    
        } else {
            var antiguedadRec = 730;
        }
        
        var diffRec_Test = 3;

      $(".popUP").hide();

      dpFrec.on("changeDate", function() {
        Receta.show();
        l_enable_docs("#div_rec", this.value);
        revalidateFields();
        fecha_alerta(this.value);
        chkFech_Doc(
          Receta.existingFileNames.length,
          Test_Embarazo.existingFileNames.length
        );
        });

      dpTest.on("changeDate", function() {
        Test_Embarazo.show();
        l_enable_docs("#div_test", this.value);
        revalidateFields();
        chkFech_Doc(
          Receta.existingFileNames.length,
          Test_Embarazo.existingFileNames.length
        );
      });

      dpOtro.on("changeDate", function() {
        Otro.show();
        l_enable_docs("#div_otro", this.value);
        revalidateFields();
      });

      dpFrec.on("clearDate", function() {
        Receta.hide();
        $("#fin_venta").attr("disabled", true);
        });

      dpTest.on("clearDate", function() {
        Test_Embarazo.hide();
        $("#fin_venta").attr("disabled", true);
        });

      dpOtro.on("clearDate", function() {
        Otro.hide();
        });

      $("#response").click(function() {
        $("#response").hide(300);
      });

      $(".form")
            .formValidation({
          framework: "bootstrap",
                icon: {
            valid: "glyphicon glyphicon-ok",
            invalid: "glyphicon glyphicon-remove",
            validating: "glyphicon glyphicon-refresh"
                },
                fields: {
                    f_rec: {
                        verbose: false,
                        validators: {
                            notEmpty: {
                  message: "Por favor ingrese la fecha de la receta"
                            },
                            date: {
                  format: "YYYY-MM-DD",
                  message: "Formato de fecha invalido"
                            },
                            callback: {
                  message:
                    "La fecha de Receta no puede superar los " +
                    antiguedadRec +
                    " días de diferencia con la fecha actual",
                                callback: function(value, validator, $field) {
                    var receta = new Date(
                      l_JS_dateFormat(
                        $("#f_rec")
                          .val()
                          .replace(/\-/g, "/")
                      )
                    );
                    var hoy = new Date(
                      l_JS_dateFormat(getDate().replace(/\-/g, "/"))
                    );

                                    var diff = hoy.getTime() - receta.getTime();
                                    diff = diff / (1000 * 60 * 60 * 24);

                                    if (diff <= antiguedadRec && diff >= 0) {
                                        return true;
                    } else {
                      return false;
                                    }
                                }
                            }
                        }
                    },
                    f_test: {
                        verbose: false,
                        validators: {
                notEmpty: {
                  message: "Por favor ingrese la fecha de la receta"
                },
                            date: {
                  format: "YYYY-MM-DD",
                  message: "Formato de fecha invalido"
                            },
                            callback: {
                  message:
                    "La fecha de Test de Embarazo no debe superar los " +
                    diffRec_Test +
                    " días de diferencia con la fecha de receta",
                                callback: function(value, validator, $field) {
                    if ($("#f_test").val() != "") {
                      var receta = new Date(
                        l_JS_dateFormat(
                          $("#f_rec")
                            .val()
                            .replace(/\-/g, "/")
                        )
                      );
                      var test = new Date(
                        l_JS_dateFormat(
                          $("#f_test")
                            .val()
                            .replace(/\-/g, "/")
                        )
                      );
                                        var diff =  receta.getTime() - test.getTime();
                                        diff = diff / (1000 * 60 * 60 * 24);

                                        if (diff <= diffRec_Test && diff >= 0) {
                                            return true;
                      } else {
                        $("#fin_venta").attr("disabled", true);
                        return false;
                                        }
                                    }else{
                      $("#fin_venta").attr("disabled", false);
                                        return true;
                                    }
                                }
                            }
                        }
                    },
                    f_otro: {
                        verbose: false,
                        validators: {
                            date: {
                  format: "YYYY-MM-DD",
                  message: "Formato de fecha invalido"
                            }
                        }
                    }
                }
            })
        .on("success.form.fv", function(e) {
                e.preventDefault();
          chkFech_Doc(
            Receta.existingFileNames.length,
            Test_Embarazo.existingFileNames.length
          );
            })
            .submit(function(e){
                e.preventDefault();
            });

      /************************************/

      $("#sub_rec").click(function() {
        Receta.startUpload();
      });
      $("#can_rec").click(function() {
        Receta.cancelAll();
        Receta.reset();
        Receta.reset(false); //if you dont want remove the existing progress bars
        hide_buttons_uploads("#div_rec");
        Receta.existingFileNames.length = "";
        chkFech_Doc(
          Receta.existingFileNames.length,
          Test_Embarazo.existingFileNames.length
        );
        revalidateFields();
        $("#f_rec").attr("disabled", false);
      });

      $("#sub_test").click(function() {
        Test_Embarazo.startUpload();
      });
      $("#can_test").click(function() {
        Test_Embarazo.cancelAll();
        Test_Embarazo.reset();
        Test_Embarazo.reset(false); //if you dont want remove the existing progress bars
        hide_buttons_uploads("#div_test");
        Test_Embarazo.existingFileNames.length = "";
        chkFech_Doc(
          Receta.existingFileNames.length,
          Test_Embarazo.existingFileNames.length
        );
        revalidateFields();
        $("#f_test").attr("disabled", false);
      });

      $("#sub_otro").click(function() {
        Otro.startUpload();
      });
      $("#can_otro").click(function() {
        Otro.cancelAll();
        Otro.reset();
        Otro.reset(false); //if you dont want remove the existing progress bars
        hide_buttons_uploads("#div_otro");
        $("#fin_venta").attr("disabled", true);
        $("#f_otro").attr("disabled", false);
      });

      $("#del_ops").click(function() {
        $("#del_ops").fadeOut(600);
        var parametros = {
          oper: "DeleteRegistro",
          id_Mst: $("#id").val()
        };
        $.ajax({
          url:
            aplicacion +
    "/ajax/ajx.informe_doc_nue_pres_form.php",
          type: "POST",
          data: parametros,
          success: function(opciones) {
            if (opciones.indexOf("ERROR") != 0) {
              $(".popUP").fadeIn(600);
              $("#response").html(opciones);
            } else {
              alert(opciones);
              
            }
          }
        });
      });
      $("#fin_venta").click(function() {
        //window.location.href = '../ajax/ajx.informe_doc_nue_pres_form.php?oper=ValidaEstado&id_Pac=' +  + '&id_Mst=' + ;
        $("#del_ops").attr("disabled", true);
        $("#fin_venta").fadeOut(600);
        var parametros = {
          oper: "ValidaEstado",
          id_Mst: $("#id").val(),
          id_Pac: $("#id_Pac").val()
        };
        $.ajax({
          url:
            aplicacion +
    "/ajax/ajx.informe_doc_nue_pres_form.php",
          type: "POST",
          data: parametros,
          success: function(opciones) {
            if (opciones.indexOf("ERROR") != 0) {
              $(".popUP").fadeIn(600);
              $("#response").html(opciones);
            } else {
              alert(opciones);
            }
          }
        });
      });
    });
    $(document).on("mouseover", "#divDocs", function() {
      $('[data-toggle="tooltip"]').tooltip({
        animated: "fade",
        placement: "bottom",
        html: true
      });
    });
    $(document).on("click", ".Receta", function() {
      $("#f_rec").datepicker("show");
      Receta.existingFileNames.length = "";
      chkFech_Doc(
        Receta.existingFileNames.length,
        Test_Embarazo.existingFileNames.length
      );
      $("[name='divReceta']").hide();
    });
    $(document).on("click", ".Test", function() {
      $("#f_test").datepicker("show");
      Test_Embarazo.existingFileNames.length = "";
      chkFech_Doc(
        Receta.existingFileNames.length,
        Test_Embarazo.existingFileNames.length
      );
      $("[name='divTest Embarazo']").hide();
    });
    $(document).on("click", ".Otro", function() {
      $("#f_otro").datepicker("show");
      $("[name='divOtro']").hide();
    });
  }
);

function chkFech_Doc(Receta, Test_Embarazo) {
  var dp = document.querySelectorAll(".date"); // <= array de Datepickers
  var fRec = Receta; // <= seteo el lenght del archivo en la parte de carga de Receta
  var fTest = Test_Embarazo; // <= seteo el lenght del archivo en la parte de carga de Receta
  switch (c_gestar_val) {
    case "SI": // <= Los pacientes de capacidad de Gestar deben cumplir con la receta y con el test de embarazo (seteada la fecha y los archivos)
      if (
        dp[0].value.length > 0 &&
        dp[1].value.length > 0 &&
        (fRec > 0 && fTest > 0)
      ) {
        $("#fin_venta").attr("disabled", false);
      } else {
        $("#fin_venta").attr("disabled", true);
        revalidateFields();
      }
      break;
    default:
      if (dp[0].value.length > 0 && fRec > 0) {
        // <= regla para pacientes sin capacidad de gestar
        $("#fin_venta").attr("disabled", false);
      } else {
        $("#fin_venta").attr("disabled", true);
        revalidateFields();
      }
      break;
  }
}

function revalidateFields() {
  $(".form").formValidation("revalidateField", "f_rec");
  $(".form").formValidation("revalidateField", "f_test");
  $(".form").formValidation("revalidateField", "f_otro");
}

function setDpRec() {
  var dp = $("#f_rec").datepicker({
    format: "yyyy-mm-dd",
    language: "es",
    endDate: getDate(),
    calendarWeeks: true,
    autoclose: true,
    clearBtn: true,
    todayHighlight: true
  });
  return dp;
}

function setDpTest() {
  var dp = $("#f_test").datepicker({
    format: "yyyy-mm-dd",
    language: "es",
    endDate: getDate(),
    calendarWeeks: true,
    autoclose: true,
    clearBtn: true,
    todayHighlight: true
  });
  return dp;
}

function setDpOtro() {
  var dp = $("#f_otro").datepicker({
    format: "yyyy-mm-dd",
    language: "es",
    endDate: getDate(),
    calendarWeeks: true,
    autoclose: true,
    clearBtn: true,
    todayHighlight: true
  });

  return dp;
}

function upTest() {
  var Test_Embarazo = $("#t_embarazo").uploadFile({
            url: "../resources/JQuery-FileUpload/PHP/upload_doc_nv.php",
            dragDrop: false,
            fileName: "myfile",
    autoSubmit: false,
            allowedTypes: "jpg,png,gif,doc,pdf,zip,bmp,tif",
            returnType: "json",
            dragDropStr: "<span><b>Arrastre y suelte el archivo...</b></span>",
            maxFileCount: 1,
    showPreview: true,
    previewHeight: "200px",
    previewWidth: "200px",
    showCancel: false,
    maxFileCountErrorStr:
      ' fue subido. <br><p><b>Presione el botón <span style="color: red"><strong> "Cambiar Imagen" </strong></span> para seleccionar otro archivo.</b></p>',
    showDelete: true,
    showDone: true,
            cancelStr:"Cancelar",
            abortStr:"Abortar",
    doneStr: '<span class="upOk">Se subió el archivo</span>',
    formData: { id: $("#id").val(), tipo: "Test Embarazo" },
            onSubmit:function(obj){
      if ($("#f_test").val() == "") {
        alert("No ingreso una fecha para el Test de Embarazo");
        $("#f_test").focus();
        return false;
                } else {
        f_test = $("#f_test").val();
        l_save_date_doc("Adj_Venta_F_Test", f_test);
      }
    },
    onSelect: function(files) {
      files[0].name;
      files[0].size;
      show_buttons_uploads("#div_test");
      return true; //to allow file submission.
    },
    onSuccess: function(files, data, xhr, pd) {
      //files: list of files
      //data: response from server
      //xhr : jquer xhr object
      //alert(files + data + xhr);
      $(".ajax-file-upload-preview").hide();
      $("#sub_test").prop("disabled", true);
      $(".ajax-file-upload-green").css("display", "none");
    },
    deleteCallback: function(data, pd) {
      delFile(data);
      $("#fin_venta").attr("disabled", true);
      $("#can_test").hide();
    },
    afterUploadAll: function(obj) {
      $("#can_test").show();
      $("#sub_test").hide();
      $(".ajax-file-upload-green").css("display", "none");
            }
        });
  return Test_Embarazo;
}

function upRec() {
  var Receta = $("#receta").uploadFile({
            url: "../resources/JQuery-FileUpload/PHP/upload_doc_nv.php",
            dragDrop: false,
            fileName: "myfile",
    autoSubmit: false,
            allowedTypes: "jpg,png,gif,doc,pdf,zip,bmp,tif",
            returnType: "json",
            dragDropStr: "<span><b>Arrastre y suelte el archivo...</b></span>",
            maxFileCount: 1,
    showPreview: true,
    previewHeight: "200px",
    previewWidth: "200px",
    showCancel: false,
    showDone: true,
    showDelete: true,
    maxFileCountErrorStr:
      ' fue subido. <br><p><b>Presione el botón <span style="color: red"><strong> "Cambiar Imagen" </strong></span> para seleccionar otro archivo.</b></p>',
            cancelStr:"Cancelar",
            abortStr:"Abortar",
    doneStr:
      '<span class="upOk" disabled="disabled">Se subió el archivo</span>',
    formData: { id: $("#id").val(), tipo: "Receta" },
            onSubmit:function(obj){
      //alert(obj);
      if ($("#f_rec").val() == "") {
        alert("No ingreso una fecha para la Receta");
        $("#f_rec").focus();
        return false;
                } else {
        f_rec = $("#f_rec").val();
        l_save_date_doc("Adj_Venta_F_Rec", f_rec);
        $("#receta_val").val(obj);
      }
    },
    onSelect: function(files) {
      files[0].name;
      files[0].size;
      show_buttons_uploads("#div_rec");
      return true; //to allow file submission.
    },
    onSuccess: function(files, data, xhr, pd) {
      //files: list of files
      //data: response from server
      //xhr : jquer xhr object
      $("#sub_rec").prop("disabled", true);
      $(".ajax-file-upload-preview").hide();
      var isDisabled = $("#f_rec").prop("disabled");
      $(".ajax-file-upload-green").css("display", "none");
      chkFech_Doc(
        Receta.existingFileNames.length,
        Test_Embarazo.existingFileNames.length
      );
    },
    deleteCallback: function(data, pd) {
      delFile(data);
      $("#fin_venta").attr("disabled", true);
      $("#can_rec").hide();
    },
    afterUploadAll: function(obj) {
      $("#can_rec").show();
      $("#sub_rec").hide();
      $(".ajax-file-upload-green").css("display", "none");
            }
        });
  return Receta;
}

function upOtro() {
        var Otro = $("#otro").uploadFile({
            url: "../resources/JQuery-FileUpload/PHP/upload_doc_nv.php",
            dragDrop: false,
            fileName: "myfile",
    autoSubmit: false,
            allowedTypes: "jpg,png,gif,doc,pdf,zip,bmp,tif",
            returnType: "json",
            dragDropStr: "<span><b>Arrastre y suelte el archivo...</b></span>",
            maxFileCount: 1,
    showPreview: true,
    previewHeight: "200px",
    previewWidth: "200px",
    showCancel: true,
    showDelete: true,
    showDone: true,
    maxFileCountErrorStr:
      ' fue subido. <br><p><b>Presione el botón <span style="color: red"><strong> "Cambiar Imagen" </strong></span> para seleccionar otro archivo.</b></p>',
            cancelStr:"Cancelar",
            abortStr:"Abortar",
    doneStr: "Se subió el archivo",
    formData: { id: $("#id").val(), tipo: "Otro" },
            onSubmit:function(obj){
      $("#can_otro").hide();
      if ($("#f_otro").val() == "") {
                    alert("No ingreso una fecha para el archivo 'Otros'");
                    $("#f_otro").focus();
        return false;
                } else {
                    f_otro = $("#f_otro").val();
        l_save_date_doc("Adj_Venta_F_Otro", f_otro);
            }
    },
    onSelect: function(files) {
      $("#can_otro").hide();
      files[0].name;
      files[0].size;
      show_buttons_uploads("#div_otro");
      return true; //to allow file submission.
    },
    onSuccess: function(files, data, xhr, pd) {
      $("#can_otro").hide();
      //files: list of files
      //data: response from server
      //xhr : jquer xhr object
      //alert(files + data + xhr);
      $(".ajax-file-upload-preview").hide();
      $("#sub_otro").prop("disabled", true);
    },
    deleteCallback: function(data, pd) {
      delFile(data);
      $("#sub_otro").show();
    },
    afterUploadAll: function(obj) {
      $("#can_otro").show();
      $("#sub_otro").hide();
      $("#fin_venta").prop("disabled", "true");
                      }
        });
  return Otro;
                }

function tbl_ventas() {
    /********* DATATABLE ****************/
    // DATATABLES DE ULTIMAS VENTAS
    $("#UltVenTB").DataTable({
    ajax: {
      type: "POST",
      url: aplicacion + "/ajax/ajx.informes_ult_vent.php",
      dataSrc: "data",
      data: {
        oper: "get_ventas",
        id_Mst: $("#id").val(),
        f_rec: $("#f_rec").val(),
        id_Pac: $("#id_Pac").val()
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
            {
        data: "fecha_receta"
            }, // 2
            {
        data: "consentimiento"
            }, // 3
            {
        data: "dosis"
            }, // 4
            {
        data: "unidades"
            }, // 5 
            {
        data: "medico"
            }, // 6
            {
        data: "institucion"
            }, // 7
            {
        data: "canal"
            }, // 8
            {
        data: "APM"
            }, // 9
            {
        data: "estado"
            }, // 10
            {
        data: "documentos"
            } // 11
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
}

function fecha_alerta(val_dp) {
    var parametros = {
    oper: "val_fec_rec",
    id_Mst: $("#id").val(),
    f_rec: val_dp,
    id_Pac: $("#id_Pac").val()
    };
    $.ajax({
        type: "POST",
    url:
      aplicacion + "/ajax/ajx.informe_doc_nue_pres_form.php",
        data: parametros,
        success: function(data) {
            if (!$.trim(data)) {
        $("#alert_fecha").html("");
                $("#tbl_ventas").hide();
            } else {
        $("#alert_fecha").html(data);
                alert("La fecha de receta fue informada anteriormente");
                tbl_ventas();
                $("#tbl_ventas").show();
            }
        }
    });
}

function l_enable_docs(id, valor){
  if (valor !== 0) {
    $(id).fadeIn(600);
  }else{
    $(id).fadeOut(600);
  }
}

function l_JS_dateFormat(valor){
    var fecha;
    if(valor.indexOf("-")){
        fecha = valor.split("/");
        return fecha[1] + "/" + fecha[2] + "/" + fecha[0];
    }
    return valor;
}

function l_save_date_doc(oper, fecha){
    var parametros = {
    oper: oper,
    id_Maestro: $("#id").val(),
    fecha: fecha
    };
    $.ajax({
    url: aplicacion + "/ajax/ajx.informe_nue_pres_form.php",
        type: "POST",
        data: parametros,
        success: function (opciones) {
            if (opciones.indexOf("ERROR")  != 0) {
            } else {
                alert(opciones);
            }
        }
    });
}

function getDocs() {
  var parametros = {
    idMst: $("#id").val(),
    oper: "getDocs",
    ref: "soliris_maestro"
  };
  $.ajax({
    type: "POST",
    url: "../ajax/ajx.getDocs.php",
    data: parametros,
    success: function(data) {
      obj = JSON.parse(data);
      if (obj.length) {
        var urlDocs = aplicacion + "/documentacion/";
        var recDoc = 0;
        var testDoc = 0;
        $("#fDocs").html(
          "<div><h4>Documentos Cargados:</h4></div><div><p>* Click para ver Imagen</p></div><br>"
        );
        $.each(obj, function(i, v) {
          switch (v.tipo) {
            case "Receta":
              recDoc = 1;
              Receta.existingFileNames.length = 1;
              break;

            case "Test Embarazo":
              testDoc = 1;
              Test_Embarazo.existingFileNames.length = 1;
              break;
          }
          $("#fDocs").append(
            '<div class="alert alert-success col-md-2 fade in text-center" id="divDocs" name="div' +
              v.tipo +
              '">' +
              "<button data-toggle=\"tooltip\" title=\"<img id='imgDoc' src='" +
              urlDocs +
              v.documento +
              '\'/>" class="btn btn-sm btn-success"  onclick="showDoc(\'' +
              v.documento +
              "')\">" +
              v.tipo +
              "</button>" +
              "<br>" +
              "<br>" +
              '<button class="btn btn-sm btn-danger ' +
              v.tipo +
              '">Cambiar Imagen</button>' +
              "</div>"
          );
        });
        chkFech_Doc(recDoc, testDoc);
      }
    }
  });
}

function showDoc(doc) {
  var urlDocs = aplicacion + "/documentacion/";
  window.open(urlDocs + doc, "_blank");
}

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

function hide_buttons_uploads(div_value) {
  $(div_value)
    .find("button")
    .prop("disabled", true);
  $(div_value)
    .find("button")
    .hide();
}

function show_buttons_uploads(div_value) {
  $(div_value)
    .find("button")
    .prop("disabled", false);
  $(div_value)
    .find("button")
    .show();
}

function delFile(file) {
  if (confirm("¿Eliminar el Archivo " + file[0] + " ?")) {
    $.post(
      "../resources/JQuery-FileUpload/PHP/delete.php",
      { op: "delete", name: file[2] },
      function(resp, textStatus, jqXHR) {
        //Show Message
        alert("Se eliminó el archivo " + file[0]);
      }
    );
    } else {
    alert("Se canceló la acción");
    }
}


function getUrlHTTP() {

  var path = window.location.pathname;
  var appName = path.split("/");
  return appName[1];
}