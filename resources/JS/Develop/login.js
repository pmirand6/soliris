/* version 1.1 */
var aplicacion = getCurrentHostname() + '/' + getUrlHTTP();
$(document).ready(function() {
    // DOM ready
    getProfile();

    $('#form').on('submit' ,function(e){
        e.preventDefault();
        if(setProfile()){
            window.location.href = aplicacion + '/defa.php';
        }else{
            alert("Verifique el usuario y la contraseña introducidos")
        };
    });
});
function setProfile(){
    var respuesta;
    var parametros = {
        "oper": "logUser",
        "usuario": $('#inputUser').val(),
        "password": $('#inputPassword').val()
    };
    $.ajax({
        url: aplicacion + '/ajax/ajx.login.php',
        type: "POST",
        data: parametros,
        contentType: "application/x-www-form-urlencoded",
        async: false,
        success: function (data) {
            if (data.indexOf("ERROR") == -1) {
                //if($('#remember_me').prop('checked')) {sessionStorage.setItem("REVL-RememberUser", $('#inputUser').val());};
                respuesta = true;
            } else {
                respuesta = false;
            }
        }
    });
    return respuesta;
}
function getProfile(){
    var LS_User = sessionStorage.getItem("REVL-RememberUser");
    var parametros = {
        "oper": 'getLogUser'
    };
    $.ajax({
        url: aplicacion + '/ajax/ajx.login.php',
        type: "POST",
        data: parametros,
        dataType: "text",
        contentType: "application/x-www-form-urlencoded",
        async: false,
        success: function (data) {
            if (data != ''){
                $("#profile-name").html(data);
                $("#profile-name").append('<i class="fa fa-close text-danger pointer" title="¡Olvídame!" style="margin-left: 10px" onclick="deleteProfile(' + aplicacion + '/login.php\')"></i>');
                $("#inputUser").val(data);
                $("#remember").hide();
            } else {
                if (LS_User){
                    $("#profile-name").html(LS_User);
                    $("#profile-name").append('<i class="fa fa-close text-danger pointer" title="¡Olvídame!" style="margin-left: 10px" onclick="deleteProfile(' + aplicacion + '/login.php\')"></i>');
                    $("#inputUser").val(LS_User);
                    $("#remember").hide();
                };
            }
        }
    });
}
function deleteProfile(){
    var parametros = {
        "oper": 'delLogUser'
    };
    $.ajax({
        url: aplicacion + '/ajax/ajx.login.php',
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
    // window.location.href = window.location.href;
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

function getUrlHTTP() {

    var path = window.location.pathname;
    var appName = path.split("/");
    return appName[1];
}
