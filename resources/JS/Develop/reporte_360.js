const newLocal = "../ajax/ajx.reporte_360.php";
const _url = "?tabla=revlimid_maestro&campo=";
var aplicacion = getCurrentHostname() + '/' + getUrlHTTP();

var selectsElements = document.querySelectorAll("select.selectpicker");


for (i = 0; i < selectsElements.length; ++i) {
  
  selectsElements[i].addEventListener("change", postQuery); // Definimios el lister para el evento change del combo select
}

$(document).ready(function () {
  $("#secPrincipal").show();
  if (window.location.search === "") {
    $("#secPrincipal").hide();
    $("#pHelp").show();
    $("#tDat").hide();
  } else {
    $("#pHelp").hide();
    $("#tDat").show();
    $("#secPrincipal").show();
    
  }

  $("#btnExcel").click(function () {
    $("#tblPrincipal").tableExport({
      type: "excel",
      fileName: "reporte_360",
      tableName: "reporte_360",
      worksheetName: "reporte_360",
      htmlContent: false,
      excelstyles: [
        "td",
        "tr",
        "th",
        "thead",
        "border-bottom",
        "border-top",
        "border-left",
        "border-right"
      ]
    });
  });


  var url_json = newLocal;

  var sel_med = $("#sel_med").selectpicker({
    liveSearchPlaceholder: "Presione una tecla",
    header: "Seleccione un Médico",
    liveSearchStyle: "contains"
    //size: "auto"
  });

  var sel_inst = $("#sel_inst").selectpicker({
    liveSearchPlaceholder: "Presione una tecla",
    header: "Seleccione una Institución",
    liveSearchStyle: "contains"
    //size: "auto"
  });

  var sel_can = $("#sel_can").selectpicker({
    liveSearchPlaceholder: "Presione una tecla",
    header: "Seleccione un Canal",
    liveSearchStyle: "contains"
    //size: "auto"
  });

  var sel_apm = $("#sel_apm").selectpicker({
    liveSearchPlaceholder: "Presione una tecla",
    header: "Seleccione un APM",
    liveSearchStyle: "contains"
    //size: "auto"
  });

  var sel_pat = $("#sel_pat").selectpicker({
    size: "auto"
  });

  var sel_dos = $("#sel_dos").selectpicker({
    size: "auto"
  });

  var sel_uni = $("#sel_uni").selectpicker({
    size: "auto"
  });

  var sel_edad = $("#sel_edad").selectpicker({
    size: "auto"
  });

  var sel_year = $("#yearVenta").selectpicker({
    size: "auto"
  });

  var sel_month = $("#mesVenta").selectpicker({
    size: "auto"
  });



  $.getJSON(url_json, {
    oper: "j_meds"
  }, function (data) {
    $.each(data, function (key, val) {
      $("#sel_med").append(
        $("<option>", {
          id: 'm.medico_id',
          value: val.ID,
          text: val.nombre_med
        })
      );
      sel_med.selectpicker("refresh");
    });
  });

  $.getJSON(url_json, {
    oper: "j_inst"
  }, function (data) {
    $.each(data, function (key, val) {
      $("#sel_inst").append(
        $("<option>", {
          id: 'm.institucion',
          value: val.inst_nom,
          text: val.inst_nom
        })
      );
      sel_inst.selectpicker("refresh");
    });
  });

  $.getJSON(url_json, {
    oper: "j_can"
  }, function (data) {
    $.each(data, function (key, val) {
      $("#sel_can").append($("<option>", {
        id: "m.canal",
        value: val.can_nom,
        text: val.can_nom
      }));
      sel_can.selectpicker("refresh");
    });
  });

  $.getJSON(url_json, {
    oper: "j_apm"
  }, function (data) {
    $.each(data, function (key, val) {
      $("#sel_apm").append($("<option>", {
        id: "m.apm",
        value: val.apm,
        text: val.apm
      }));
      sel_apm.selectpicker("refresh");
    });
  });

  $.getJSON(url_json, {
    oper: "j_pat"
  }, function (data) {
    $.each(data, function (key, val) {
      $("#sel_pat").append($("<option>", {
        id: "m.patologia",
        value: val.pat,
        text: val.pat
      }));
      sel_pat.selectpicker("refresh");
    });
  });

  $.getJSON(url_json, {
    oper: "j_dos"
  }, function (data) {
    $.each(data, function (key, val) {
      $("#sel_dos").append($("<option>", {
        id: "m.dosis",
        value: val.dosis,
        text: val.dosis
      }));
      sel_dos.selectpicker("refresh");
    });
  });

  $.getJSON(url_json, {
    oper: "j_uni"
  }, function (data) {
    $.each(data, function (key, val) {
      $("#sel_uni").append($("<option>", {
        id: "m.Unidades",
        value: val.uni,
        text: val.uni
      }));
      sel_uni.selectpicker("refresh");
    });
  });

  $.getJSON(url_json, {
    oper: "j_edad"
  }, function (data) {
    $.each(data, function (key, val) {
      $("#sel_edad").append($("<option>", {
        id: "m.edad",
        value: val.edad,
        text: val.edad
      }));
      sel_edad.selectpicker("refresh");
    });
  });

  $.getJSON(url_json, {
    oper: "j_year"
  }, function (data) {
    $.each(data, function (key, val) {
      $("#yearVenta").append($("<option>", {
        id: "year(m.fecha_venta)",
        value: val.f_venta,
        text: val.f_venta
      }));
      sel_year.selectpicker("refresh");
    });
  });

  $.getJSON(url_json, {
    oper: "j_mes"
  }, function (data) {
    $.each(data, function (key, val) {
      $("#mesVenta").append($("<option>", {
        id: "month(m.fecha_venta)",
        value: key,
        text: val
      }));
      sel_month.selectpicker("refresh");
    });
  });




  // Add minus icon for collapse element which is open by default
  $(".collapse.in").each(function () {
    $(this)
      .siblings(".panel-heading")
      .find(".glyphicon")
      .addClass("glyphicon-minus")
      .removeClass("glyphicon-plus");
  });

  // Toggle plus minus icon on show hide of collapse element
  $(".collapse")
    .on("show.bs.collapse", function () {
      $(this)
        .parent()
        .find(".glyphicon")
        .removeClass("glyphicon-plus")
        .addClass("glyphicon-minus");
    })
    .on("hide.bs.collapse", function () {
      $(this)
        .parent()
        .find(".glyphicon")
        .removeClass("glyphicon-minus")
        .addClass("glyphicon-plus");
    });
});

function postQuery() {
  var txtOpt = this.options[this.selectedIndex]; // texto del option
  var colQuery = this.options[this.selectedIndex].getAttribute('id'); // id query
  var idQuery = this.value;
  
  window.location = getCurrentHostname() + _url + colQuery + "&inicial=" + idQuery + "&lim=2&plus="
  

}

function getCurrentHostname() {
  var protocolo, url, var_port, port;

  protocolo = window.location.protocol;
  url = window.location.hostname;
  var_port = window.location.port;
  path = window.location.pathname;

  if (var_port !== "") {
    port = ":" + var_port;
  } else {
    port = "";
  }

  return protocolo + "//" + url + port + path;
}

function getUrlHTTP() {

  var path = window.location.pathname;
  var appName = path.split("/");
  return appName[1];
}

function fillTblDatos(cVentas, cUnidades, cPac, pUni) {
  var values = [cVentas, cUnidades, cPac, pUni];
  var dTbl = document.getElementById("tDat");
  var prom = Math.round(values[3] * 100) / 100;

dTbl.innerHTML =
  '<table class= "table table-bordered" id="tblDatos">' +
  '<tr>' +
  '<th class="thDatos">Ventas</th>' +
  '<td id = "tVentas">' + values[0] + '</td>' +
  '</tr>' +
  '<tr>' +
  '<th class="thDatos">Unidades</th>' +
  '<td id = "tUni" >' + values[1] + '</td>' +
  '</tr>' +
  '<tr>' +
  '<th class = "thDatos" > Pacientes </th>' +
  '<td id = "tPac" >' + values[2] + '</td>' +
  '</tr>' +
  '<tr >' +
  '<th class = "thDatos" > Promedio Unidades por Pacientes </th>' +
  '<td id = "tPro" >' + prom + '</td>' +
  '</tr>' +
  '</table>';
}