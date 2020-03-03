/* version 1.0 */

var timer;
var counter = 0;
var aplicacion = getCurrentHostname() + '/' + getUrlHTTP();

$(document).ready(function () {

    window.onload = timerReset;
    document.onkeypress = timerReset;
    document.onmousemove = timerReset;
    document.onmousedown = timerReset; 
    document.ontouchstart = timerReset;
    document.onclick = timerReset;
    document.onscroll = timerReset;
    document.onkeypress = timerReset;

    $('.popUP').hide();

    pop(aplicacion + '/main/panel.php');

    startTime();
    checkLoged();
    $('[data-toggle="popover"]').popover({
        placement : 'bottom',
        html : true,
        content: function() {
            return $('#popoverUser').html();
        }
    });
    $('#if_main').load(function () {
        $('#if_main').width('100%');
        $('#if_main').height('100%');
    });
    $('.history').click(function () {
        pop('log_accesos.php');
    });
    $('.logoff').click(function () {
        deleteProfile()
    });
});
function pop(url){
    document.getElementById('if_main').src = url;
};
function startTime() {
    var today = new Date();
    var h = today.getHours();
    var m = today.getMinutes();
    var s = today.getSeconds();
    m = checkTime(m);
    s = checkTime(s);
    document.getElementById('info').innerHTML = "<p>" + "Hora actual: " + h + ":" + m + ":" + s + "<br/> <br/>Sistema de seguimiento y autorización de pacientes para el producto soliris" + "</p>";
    var t = setTimeout(function () { startTime() }, 500);
}
function checkTime(i) {
    if (i < 10) { i = "0" + i };  // add zero in front of numbers < 10
    return i;
}
function checkLoged(){
  setInterval(function(){
    $.get(aplicacion + '/ajax/ajx.logonActive.php', function( data ) {
        
        if(data == 'Session Perdida'){
            alert(data);
            deleteProfile()
            window.location.href = aplicacion + '/login.php';
        }
    });
}, 300000);
}
function viewHistory(){
    pop('log_accesos.php');
}
function deleteProfile(){
    var parametros = {
        "oper": 'delLogUser'
    };
    $.ajax({
        url: 'ajax/ajx.login.php',
        type: "POST",
        data: parametros,
        async: false,
        success: function () {
            $("#profile-name").html('');
            $("#inputUser").val('');
            $("#inputPassword").val('');
            $("#inputUser").show();
            $("#remember").show();
        }
    });
    sessionStorage.clear();
    window.location.href = 'login.php';
}


function getCurrentHostname(){
    var protocolo, url, var_port, port;

    protocolo = window.location.protocol;
    url = window.location.hostname;
    var_port = window.location.port;

    if (var_port !== '') {
        port = ':' + var_port;
    } else {
        port = '';
    }

    return protocolo + '//' + url + port;
}

function timerElapsed() {
    counter = counter + 1;
    if (counter == 5) { // El modal se mostrará a los 25 minutos sin actividad
       $('#modal_session').modal({
          backdrop: 'static', // se previene del cierre del modals
          keyboard: false
        })
       timerReset();  
    } else if (counter == 6) { // la sesión expirará despues de los 30 min sin actividad
        $('#modal_session').modal('hide');
        $('#modal_session').on('hidden.bs.modal', function () {
            alert("Sesión Caducada");
            deleteProfile();
        })
    } else {
        //document.getElementById('if_main').contentWindow.location.reload();  
        timerReset();  
    }
};

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

