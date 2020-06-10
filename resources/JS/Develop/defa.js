/* version 1.0 */

var timer;
var counter = 0;
var aplicacion = getCurrentHostname() + "/" + getUrlHTTP();

$(document).ready(function () {
  window.onload = timerReset;
  document.onkeypress = timerReset;
  document.onmousemove = timerReset;
  document.onmousedown = timerReset;
  document.ontouchstart = timerReset;
  document.onclick = timerReset;
  document.onscroll = timerReset;
  document.onkeypress = timerReset;

  $(".popUP").hide();
  
  /**
   * Se actualiza esta funcion con la idea de que 
   * pueda ser redirigida a la url provista por un mail
   * o link y cargar directamente en el iframe 
   * la url de la pagina
   * Ejemplo de pagina con argumentos(queryString)
   * 'http://localhost/soliris/defa.php?url=/main/modificar_venta.php&args=?idVenta=67'
   * url= /main/modificar_venta.php
   * args=?idVenta=67
   * FIXME considerar en una nueva implementacion agregar un parametro mas de opcion
   * como por ejemplo poder manejar la url: 
   * http://localhost/soliris/main/modificar_venta.php/?idVenta=67&read=true
   */
  if (getQuerystring("url")) {
    var urlParams = new URLSearchParams(location.search);
    
    let page = urlParams.get('url');
    let args = urlParams.get('args');
    
    /**
     * Verifico que la pagina no tenga un querystring
     */
    if(args == null){
        pop(aplicacion + page);
    } else {
        pop(aplicacion + page + args);
    }
    //Limpio la url para que visualmente no queden los argumentos pasados por el mail
    window.history.pushState({}, document.title, aplicacion + "/" + "defa.php");

    
    
  } else {
    pop(aplicacion + "/main/panel.php");
  }

  startTime();
  checkLoged();
  $('[data-toggle="popover"]').popover({
    placement: "bottom",
    html: true,
    content: function () {
      return $("#popoverUser").html();
    },
  });
  $("#if_main").load(function () {
    $("#if_main").width("100%");
    $("#if_main").height("100%");
  });
  $(".history").click(function () {
    pop("log_accesos.php");
  });
  $(".logoff").click(function () {
    deleteProfile();
  });
});
// Setea los valores del usuario en Local Storage usuario
function l_setUserProfile($usuario, $grupo) {
  localStorage.clear();
  localStorage.removeItem("usuario");
  const usuario = {
    username: $usuario,
    grupo: $grupo,
  };
  window.localStorage.setItem("usuario", JSON.stringify(usuario));
}

function pop(url) {
  document.getElementById("if_main").src = url;
}

function setMultipleAttributes(el, attributes) {
  for (var attr in attributes) el.setAttribute(attr, attributes[attr]);
}

function startTime() {
  var today = new Date();
  var h = today.getHours();
  var m = today.getMinutes();
  var s = today.getSeconds();
  m = checkTime(m);
  s = checkTime(s);
  document.getElementById("info").innerHTML =
    "<p>" +
    "Hora: " +
    h +
    ":" +
    m +
    ":" +
    s +
    "&nbsp;   Fecha: " + getDate() +
    "<br/> <br/>Sistema de seguimiento y autorización de pacientes para el producto soliris" +
    "</p>";
  var t = setTimeout(function () {
    startTime();
  }, 500);
}
function checkTime(i) {
  if (i < 10) {
    i = "0" + i;
  } // add zero in front of numbers < 10
  return i;
}
function checkLoged() {
  setInterval(function () {
    $.get(aplicacion + "/ajax/ajx.logonActive.php", function (data) {
      if (data == "Session Perdida") {
        alert(data);
        deleteProfile();
        window.location.href = aplicacion + "/login.php";
      }
    });
  }, 300000);
}
function viewHistory() {
  pop("log_accesos.php");
}

function getDate(){
  var today = new Date();
  var dd = today.getDate();
  var mm = today.toLocaleString('default', { month: 'long' }); //January is 0!
  var yyyy = today.getFullYear();

  if(dd<10) {
      dd='0'+dd
  }

  if(mm<10) {
      mm='0'+mm
  }

  return dd + '-' + mm + '-' + yyyy;
}

function deleteProfile() {
  var parametros = {
    oper: "delLogUser",
  };
  $.ajax({
    url: "ajax/ajx.login.php",
    type: "POST",
    data: parametros,
    async: false,
    success: function () {
      $("#profile-name").html("");
      $("#inputUser").val("");
      $("#inputPassword").val("");
      $("#inputUser").show();
      $("#remember").show();
    },
  });
  localStorage.clear();
  window.location.href = "login.php";
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

function timerElapsed() {
  counter = counter + 1;
  if (counter == 5) {
    // El modal se mostrará a los 25 minutos sin actividad
    $("#modal_session").modal({
      backdrop: "static", // se previene del cierre del modals
      keyboard: false,
    });
    timerReset();
  } else if (counter == 6) {
    // la sesión expirará despues de los 30 min sin actividad
    $("#modal_session").modal("hide");
    $("#modal_session").on("hidden.bs.modal", function () {
      alert("Sesión Caducada");
      deleteProfile();
    });
  } else {
    //document.getElementById('if_main').contentWindow.location.reload();
    timerReset();
  }
}

function timerReset() {
  clearTimeout(timer);
  timer = setTimeout(timerElapsed, 5 * 60 * 1000);
  //timer = setTimeout(timerElapsed, 1 * 30 * 100);
}

function getUrlHTTP() {
  var path = window.location.pathname;
  var appName = path.split("/");
  return appName[1];
}

function change_location(value) {
  $.ajax({
    type: "POST",
    data: {
      grupo: value,
    },
    url: "defa.php",
    success: function (data) {
      window.location.reload();
    },
  });
}

function getQuerystring(key, default_) {
  if (default_ == null) default_ = "";
  key = key.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
  var regex = new RegExp("[\\?&]" + key + "=([^&#]*)");
  var qs = regex.exec(window.location.href);
  if (qs == null) return default_;
  else return qs[1];
}

function getUrlParameter(name) {
  name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
  var regex = new RegExp("[\\?&]" + name + "=([^&#]*)");
  var results = regex.exec(location.search);
  return results === null
    ? ""
    : decodeURIComponent(results[1].replace(/\+/g, " "));
}
