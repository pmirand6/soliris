function getQuerystring(key, default_){
    if (default_==null) default_="";
    key = key.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
    var regex = new RegExp("[\\?&]"+key+"=([^&#]*)");
    var qs = regex.exec(window.location.href);
    if(qs == null)
        return default_;
    else
        return qs[1];
}
function openfile(file){
    window.open(getCurrentHostname() + '/soliris/documentacion/' + file);
}
function hostname(){
    return getCurrentHostname() + '/soliris';
}
function editDocs(){
    window.location.href = 'docs_paciente.php?id=' + getQuerystring("id");
}
function getDate(){
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1; //January is 0!
    var yyyy = today.getFullYear();

    if(dd<10) {
        dd='0'+dd
    }

    if(mm<10) {
        mm='0'+mm
    }

    return yyyy + '-' + mm + '-' + dd;
}


function wait(ms){
   var start = new Date().getTime();
   var end = start;
   while(end < start + ms) {
     end = new Date().getTime();
  }
}