var selected = [];
var count_select = 0;
var count_changes = 0;
var rowData_med = [];
var rowData_med_m = [];
var tbl_med = "";
var tbl_med_Med = "";
var aplicacion = getCurrentHostname() + '/' + getUrlHTTP();

$(document).ready(function() {

    tbl_med = $("#DataMed").DataTable( {
        "bPaginate": true,
        "iDisplayLength": 5,
        "sPaginationType": "full_numbers",
        "processing": true,
        "ajax": {
            "type": 'POST',
            "dataSrc": function(json) {
                if (!json.data) {
                 json.data = [];
             }
             return json.data;
         },
         'url': aplicacion + "/ajax/ajx.diff_med.php",
         'data': {
            oper: 'getMed'
        },
    },
    "select": {
        style: 'single'
    },
    "sDom": '<"top"B>rt<"bottom"ip><"clear">',
    "deferRender": true,
    "autoWidth": false,
    "order": [ 1, "asc" ],
    "aoColumns": [
    { "mData": "id", "bSearchable": true, "sClass": "center"},
    { "mData": "ape", "bSearchable": true, "sWidth": "20%", "sClass": "center"},
    { "mData": "nom", "bSearchable": true, "sWidth": "20%", "sClass": "center"},
    { "mData": "m_nac", "bSearchable": true, "sWidth": "1%", "sClass": "center"},
    { "mData": "m_prov", "bSearchable": true, "sWidth": "2%", "sClass": "center"},
    { "mData": "apm_nom", "bSearchable": true, "sWidth": "10%", "sClass": "center"},
    { "mData": "apm_id", "bSearchable": false, "bVisible": false, "sClass": "center"}
    ],
    "buttons": [
    { extend: 'copyHtml5', text: '<i class="fa fa-files-o" aria-hidden="true"></i> Copiar'},
    { extend: 'print', text: '<i class="fa fa-print" aria-hidden="true"></i> Imprimir'},
    { extend: 'excel', text: '<i class="fa fa-file-excel-o" aria-hidden="true"></i> Excel'},
    ],
    "oLanguage": {
        "sProcessing":     "Procesando...",
        "sLengthMenu":     "Mostrar _MENU_ registros",
        "sZeroRecords":    "No se encontraron resultados",
        "sEmptyTable":     "Ningún dato disponible en esta tabla",
        "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
        "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
        "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
        "sInfoPostFix":    "",
        "sSearch":         "Buscar:",
        "sUrl":            "",
        "sInfoThousands":  ",",
        "sLoadingRecords": "Cargando...",
        "oPaginate": {
         "sFirst":    "Primero",
         "sLast":     "Último",
         "sNext":     "Siguiente",
         "sPrevious": "Anterior"
     },
     "oAria": {
         "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
         "sSortDescending": ": Activar para ordenar la columna de manera descendente"
     },
     select: {
        rows: {
            _: "Seleccionadas %d filas</b>",
            0: "<b>Click en una fila para seleccionarla</b>",
            1: " <b>Registro Seleccionado</b>"
        }
    },
    buttons: {
        copyTitle: 'Copiado al Portapapeles',
        copyKeys: 'Presione <i>CRTL</i> ó <i>\u2318</i> + <i>C</i> para copiar la tabla en el documento que desee. <br><br>Para cancelar, haga click sobre este mensaje o presione la tecla ESC.',
        copySuccess: {
            _: '%d líneas copiadas',
            1: '1 línea copiada'
        }
    }            
}
});

    tbl_med_Med = $("#DataMed_Med").DataTable( {
        "bPaginate": true,
        "iDisplayLength": 5,
        "sPaginationType": "full_numbers",
        "processing": true,
        "ajax": {
           'type': 'POST',
           "dataSrc": function(json) {
            if (!json.data) {
             json.data = [];
         }
         return json.data;
     },
     "url": aplicacion + "/ajax/ajx.diff_med.php",
     "data": {
        oper: 'getMed_Med'
    },
},
"select": {
    style: 'single'
},
"sDom": '<"top"B>rt<"bottom"ip><"clear">',
"deferRender": true,
"autoWidth": false,
"order": [ 1, "asc" ],
"aoColumns": [
{ "mData": "id", "bSearchable": true, "sClass": "center"},
{ "mData": "ape", "bSearchable": true, "sWidth": "20%", "sClass": "center"},
{ "mData": "nom", "bSearchable": true, "sWidth": "20%", "sClass": "center"},
{ "mData": "m_nac", "bSearchable": true, "sWidth": "10%", "sClass": "center"},
{ "mData": "m_prov", "bSearchable": true, "sWidth": "20%", "sClass": "center"},
{ "mData": "apm_nom", "bSearchable": true, "sWidth": "10%", "sClass": "center"},
{ "mData": "apm_id", "bSearchable": false, "bVisible": false, "sClass": "center"}

],
"buttons": [
{ extend: 'copyHtml5', text: '<i class="fa fa-files-o" aria-hidden="true"></i> Copiar'},
{ extend: 'print', text: '<i class="fa fa-print" aria-hidden="true"></i> Imprimir'},
{ extend: 'excel', text: '<i class="fa fa-file-excel-o" aria-hidden="true"></i> Excel'}
],
"oLanguage": {
    "sProcessing":     "Procesando...",
    "sLengthMenu":     "Mostrar _MENU_ registros",
    "sZeroRecords":    "No se encontraron resultados",
    "sEmptyTable":     "Ningún dato disponible en esta tabla",
    "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
    "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
    "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
    "sInfoPostFix":    "",
    "sSearch":         "Buscar:",
    "sUrl":            "",
    "sInfoThousands":  ",",
    "sLoadingRecords": "Cargando...",
    "oPaginate": {
     "sFirst":    "Primero",
     "sLast":     "Último",
     "sNext":     "Siguiente",
     "sPrevious": "Anterior"
 },
 "oAria": {
     "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
     "sSortDescending": ": Activar para ordenar la columna de manera descendente"
 },
 select: {
    rows: {
        _: "Seleccionadas %d filas</b>",
        0: "<b>Click en una fila para seleccionarla</b>",
        1: " <b>Registro Seleccionado</b>"
    }
},
buttons: {
    copyTitle: 'Copiado al Portapapeles',
    copyKeys: 'Presione <i>CRTL</i> ó <i>\u2318</i> + <i>C</i> para copiar la tabla en el documento que desee. <br><br>Para cancelar, haga click sobre este mensaje o presione la tecla ESC.',
    copySuccess: {
        _: '%d líneas copiadas',
        1: '1 línea copiada'
    }
}            
}
});

    $("#DataMed_wrapper .dt-buttons").append('<button type="button" id="btn_comp" class="btn btn-info btn_comp" data-toggle="modal" data-target="#m_comp" onclick="f_l_comp();">Comparar Registros</button>');
    $("#btn_comp").prop('disabled', true) 
    //f_l_e_btn_c(count_select)

    $('#DataMed_Med tfoot th').each( function () {
        var title = $(this).text();
        $(this).html( '<input type="text" class="form-control input-sm" placeholder="Buscar '+title+'" />' );
    });

    $('#DataMed tfoot th').each( function () {
        var title = $(this).text();
        $(this).html( '<input type="text" class="form-control input-sm" placeholder="Buscar '+title+'" />' );
    });
    


    tbl_med
    .on( 'select', function ( e, dt, type, indexes ) {
       rowData_med = tbl_med.row( indexes ).data();
       count_select = count_select + 1;
       f_l_e_btn_c(count_select)
   })
    .on( 'deselect', function ( e, dt, type, indexes ) {
        count_select = count_select - 1;
        f_l_e_btn_c(count_select)
        rowData_med = "";
    });

    tbl_med_Med
    .on( 'select', function ( e, dt, type, indexes ) {
       rowData_med_m = tbl_med_Med.row( indexes ).data();
       count_select = count_select + 1;
       f_l_e_btn_c(count_select)

   })
    .on( 'deselect', function ( e, dt, type, indexes ) {
        count_select = count_select - 1;
        rowData_med_m = "";
        f_l_e_btn_c(count_select)
    }); 

    $('#DataMed tfoot tr').appendTo('#DataMed thead');
    $('#DataMed_Med tfoot tr').appendTo('#DataMed_Med thead');

    tbl_med.columns().every( function () {
        var that = this;
        $( 'input', this.footer() ).on( 'keyup change', function () {
            if ( that.search() !== this.value ) {
                that
                .search( this.value )
                .draw();
            }
        });
    });

    tbl_med_Med.columns().every( function () {
        var that = this;
        $( 'input', this.footer() ).on( 'keyup change', function () {
            if ( that.search() !== this.value ) {
                that
                .search( this.value )
                .draw();
            }
        });
    });
    
});

function f_l_comp(){

    $("#m_comp .btn-primary").prop('disabled', true)
    $("#btn_frm_comp").prop('disabled', true)

    $("#txt_id").val(rowData_med["id"])
    $("#txt_ape").val(rowData_med["ape"])
    $("#txt_nom").val(rowData_med["nom"])
    $("#txt_m_n").val(rowData_med["m_nac"])
    $("#txt_m_p").val(rowData_med["m_prov"])
    $("#txt_apm").val(rowData_med["apm_nom"])
    $("#txt_apm_id").val(rowData_med["apm_id"])

    $("#txt_id_m").val(rowData_med_m["id"])
    $("#txt_ape_m").val(rowData_med_m["ape"])
    $("#txt_nom_m").val(rowData_med_m["nom"])
    $("#txt_m_n_m").val(rowData_med_m["m_nac"])
    $("#txt_m_p_m").val(rowData_med_m["m_prov"])
    $("#txt_apm_m").val(rowData_med_m["apm_nom"])
    $("#txt_apm_id_m").val(rowData_med_m["apm_id"])

/////////    BOTONES DE CAMBIO /////////////////////  

$("#btn_ape_m").click(function(e){
    $("#txt_ape").val(rowData_med_m["ape"])
    $("#btn_ape_m_c").prop('disabled', false)
    count_changes = count_changes + 1;
    f_l_e_btn(count_changes)
});
$("#btn_nom_m").click(function(e){
    $("#txt_nom").val(rowData_med_m["nom"])
    $("#btn_nom_m_c").prop('disabled', false)
    count_changes = count_changes + 1;
    f_l_e_btn(count_changes)
});
$("#btn_mat_n_m").click(function(e){
    $("#txt_m_n").val(rowData_med_m["m_nac"])
    $("#btn_mat_n_m_c").prop('disabled', false)
    count_changes = count_changes + 1;
    f_l_e_btn(count_changes)
});
$("#btn_mat_p_m").click(function(e){
    $("#txt_m_p").val(rowData_med_m["m_prov"])
    $("#btn_mat_p_m_c").prop('disabled', false)
    count_changes = count_changes + 1;
    f_l_e_btn(count_changes)
});
$("#btn_apm_m").click(function(e){
    $("#txt_apm").val(rowData_med_m["apm_nom"])
    $("#txt_apm_id").val(rowData_med_m["apm_id"])
    $("#btn_apm_m_c").prop('disabled', false)
    count_changes = count_changes + 1;
    f_l_e_btn(count_changes)
});
/////////    BOTONES DE DESHACER /////////////////////    

$("#btn_ape_m_c").click(function(e){
    $("#txt_ape").val(rowData_med["ape"])
    this.disabled=true
    count_changes = count_changes - 1;
    f_l_e_btn(count_changes)
});
$("#btn_nom_m_c").click(function(e){
    $("#txt_nom").val(rowData_med["nom"])
    this.disabled=true
    count_changes = count_changes - 1;
    f_l_e_btn(count_changes)
});
$("#btn_mat_n_m_c").click(function(e){
    $("#txt_m_n").val(rowData_med["m_nac"])
    this.disabled=true
    count_changes = count_changes - 1;
    f_l_e_btn(count_changes)
});
$("#btn_mat_p_m_c").click(function(e){
    $("#txt_m_p").val(rowData_med["m_prov"])
    this.disabled=true
    count_changes = count_changes - 1;
    f_l_e_btn(count_changes)
});
$("#btn_apm_m_c").click(function(e){
    $("#txt_apm").val(rowData_med["apm_nom"])
    $("#txt_apm_id").val(rowData_med["apm_id"])
    this.disabled=true
    count_changes = count_changes - 1;
    f_l_e_btn(count_changes)
});
}

function f_l_e_btn(val) {

    var x = val
    

    if (x > 0) {
        $("#btn_frm_comp").prop('disabled', false)
    } else {
        $("#btn_frm_comp").prop('disabled', true)
    }
}

function f_l_e_btn_c(val) {

    var x = val
    

    if (x % 2 == 0) {
        $("#btn_comp").prop('disabled', false)
    } else {
        $("#btn_comp").prop('disabled', true)    
    }
}

$("#btn_frm_comp").click(function(e){

    e.preventDefault()
    var parametros = {
        "oper": "up_med",
        "m_id" : $("#txt_id").val(), // id_medico
        "m_ape" : $("#txt_ape").val(), // apellido medico
        "m_nom" : $("#txt_nom").val(), // nombre medico
        "m_m_n" : $("#txt_m_n").val(), // matricula nacional
        "m_m_p" : $("#txt_m_p").val(), // matricula provincial
        "m_apm" : $("#txt_apm").val(), // nombre apm
        "m_apm_id": $("#txt_apm_id").val(), // id apm
        "id_meditec": $("#txt_id_m").val(), // id medico meditec

    };
    $.ajax({
        url: '../ajax/ajx.diff_med.php',
        type: "POST",
        data: parametros,
        success: function (data) {
            if (data.indexOf("ERROR")  != 0) {
                alert(data);
                window.location.reload();
            } else {
                alert(data);
            }
        }
    });
});

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