var aplicacion = getCurrentHostname() + "/" + getUrlHTTP();
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

function openfile(e) {
  window.open(aplicacion + "/documentacion/" + e);
}

function hostname() {
  return aplicacion;
}

function editDocs() {
  window.location.href = "docs_paciente.php?id=" + getQuerystring("id");
}

function getDate() {
  var e = new Date(),
    n = e.getDate(),
    t = e.getMonth() + 1,
    i = e.getFullYear();
  return (
    10 > n && (n = "0" + n), 10 > t && (t = "0" + t), n + "-" + t + "-" + i
  );
}

function wait(e) {
  for (var n = new Date().getTime(), t = n; n + e > t; )
    t = new Date().getTime();
}

function docs_icon(e) {
  if (-1 == e.indexOf("Sin Documentación")) {
    var n = aplicacion + "/documentacion/" + e,
      t = e.split("."),
      i = t[0].split("_"),
      o = i[0],
      r = t[t.length - 1],
      a = r.toLowerCase(),
      c = "TBL TBL-file_extension_" + a,
      s =
        '<a href="' +
        n +
        '" target="_blank"><li class="btn btn-default" style="cursor:pointer;" title="' +
        o +
        '"><span class="' +
        c +
        '" style="cursor:pointer;")"></span></li>';
    return s;
  }
  return "Sin Documentación";
}

function estado_icon(e) {
  var n = "TBL TBL-" + e;
  return (
    '<samp class="' +
    n +
    '" title="' +
    e +
    '"><p class="hidden ">' +
    e +
    "</p></samp>"
  );
}

function sexo_icon(e) {
  var n = "TBL TBL-" + e;
  return (
    '<div class="' +
    n +
    '" title="' +
    e +
    '"><p class="hidden">' +
    e +
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

$.fn.ajaxSelectPicker.locale["es-ES"] = {
  currentlySelected: "Seleccionado",
  emptyTitle: "Seleccione y comience a escribir",
  errorText: "No se puede recuperar resultados",
  searchPlaceholder: "Buscar...",
  statusInitialized: "Empieza a escribir una consulta de búsqueda",
  statusNoResults: "Sin Resultados",
  statusSearching: "Buscando...",
  statusTooShort: "Introduzca más caracteres",
};

$.fn.ajaxSelectPicker.locale.es = $.fn.ajaxSelectPicker.locale["es-ES"];

$(".date").datepicker({
  format: "yyyy-mm-dd",
  language: "es",
  endDate: getDate(),
  calendarWeeks: true,
  autoclose: true,
  clearBtn: true,
  todayHighlight: true,
});

function checkPost(value) {
  // get query arguments
  var dir = window.location.href;
  var n = dir.search(value);
  return n;
}
