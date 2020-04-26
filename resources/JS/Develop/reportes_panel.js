/**
 * 
 * JS que maneja la pagina de reportes panel
 * El graphTiposReporte es un Pie Chart que contiene los tipos de reporte en el mes (RI - FU)
 * 
 * 
 */


var aplicacion = getCurrentHostname() + '/' + getUrlHTTP();
$.getScript(aplicacion + '/resources/JS/funciones.min.js', function(){
    // script is now loaded and executed.
    // put your dependent JS here.

    var flag = false;
    $('#loading').hide();


    $(document).ready(function() {

        var currentTime = new Date()
        var hoy = currentTime.getFullYear() + "/" + (currentTime.getMonth() + 1);
        


        $('.date').datepicker({
            format: "yyyy-mm",
            language: "es",
            endDate: "31/12/" + currentTime.getFullYear(),
            calendarWeeks: true,
            autoclose: true,
            clearBtn: true,
            startView: 2,
            minViewMode: 1,
            todayHighlight: true

        });

        var fecha_hoy = $( ".date" ).datepicker( "setDate", hoy);

        if(typeof(fecha_hoy) != "undefined" && fecha_hoy !== null && flag == false) {

            var fecha = $('#fecha').val();
            
            get_month_name(fecha);

            
            $('#graphTiposReporte').load(aplicacion + '/ajax/ajx.reporte_panel_pieChart.php?fecha=' + fecha);
            $('#graph2').load(aplicacion + '/ajax/ajx.reporte_panel_barChart.php?fecha=' + fecha);
            $('#graph3').load(aplicacion + '/ajax/ajx.reporte_panel_yearStackedChart.php?fecha=' + fecha);
            $('#graph4').load(aplicacion + '/ajax/ajx.reporte_panel_areaChart.php?fecha=' + fecha);

            flag = true;

            $('#loading').hide();


        }

        $('#fecha').change(function () {
            $('.form').formValidation('revalidateField', 'fecha');
        });


        $("#DataRG").dataTable( {
            "bPaginate": true,
            "iDisplayLength": 35,
            "sPaginationType": "full_numbers",
            "bAutoWidth": true,
            "sDom": '<"top"B>frt<"bottom"ip><"clear">',
            "processing": true,
            "bDeferRender": true,
            //"sAjaxSource": aplicacion + '/ajax/ajx.reporte_panel.php',
            "ajax": {
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: aplicacion + '/ajax/ajx.reporte_panel.php',
            },
            // "deferRender": true,
            "aoColumns": [
            { "mData": "Paciente", "bSearchable": true, "sWidth": "40%", "sClass": "center"},
            { "mData": "UMes", "bSearchable": true, "sWidth": "20%", "sClass": "center"},
            { "mData": "UAnio", "bSearchable": true, "sWidth": "20%", "sClass": "center"},
            { "mData": "Esperado", "bSearchable": true, "sWidth": "20%", "sClass": "center"}
            ],
            "buttons": [
            'copy',
            'excel',
            'print'
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
             }            
         }
     });
        $('.form').formValidation({
            framework: 'bootstrap',
            excluded: ':disabled',
            icon: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                fecha: {
                    message: 'La fecha no es válida',
                    validators: {
                        notEmpty: {
                            message: 'La fecha no puede quedar vacía'
                        }
                    }
                }
            }})
        .on('success.form.fv', function (e) {
                // Prevent form submission
                e.preventDefault();
                $('#loading').show();
                var fecha = $('#fecha').val();
                get_month_name(fecha);

                //reloadTBLinitial(fecha);

                $('#graphs').show(300);
                
                $('#graphTiposReporte').load(aplicacion + '/ajax/ajx.reporte_panel_pieChart.php?fecha=' + fecha);
                $('#graph2').load(aplicacion + '/ajax/ajx.reporte_panel_barChart.php?fecha=' + fecha);
                $('#graph3').load(aplicacion + '/ajax/ajx.reporte_panel_yearStackedChart.php?fecha=' + fecha);
                $('#graph4').load(aplicacion + '/ajax/ajx.reporte_panel_areaChart.php?fecha=' + fecha);
                $('#loading').hide();
            })
        .submit(function(e){
           e.preventDefault();
       });
    });
});
function reloadTBLinitial(init) {

    //$('#loading').show(200);
    //$("#DataRG").dataTable().fnClearTable();
    //$("#datos").hide();
    //$("#loading-table").show();
    if (init != ''){
        $.get(aplicacion + '/ajax/ajx.reporte_panel.php?fecha=' + init, function (data) { doRefresh(data, "#DataRG") });
    }
}
function doRefresh(data, id) {
        // data is a string
        var dt = id;

        data = jQuery.parseJSON(data);

        //$(dt).dataTable().fnClearTable();

        if (data.aaData.length){

            $(id).dataTable().fnAddData(data.aaData);
        }
        $(dt).dataTable().fnDraw();
        $("#datos").show();

        //$('#loading-table').hide();
    }
    function getData(idDest, aRow, id, nroCol) {
        if ($(id).dataTable().fnGetData(aRow) != '' || nroCol != '') {
            $('#' + idDest).val($(id).dataTable().fnGetData(aRow)[nroCol]);
        }
    }



    function get_month_name(n) {

     var mes = "";

     var parts = n.split("-");

     var valor = parts[1];

     switch (valor) {
       case "01":
       mes = "Enero";
       break;
       case "02":
       mes = "Febrero";
       break;
       case "03":
       mes = "Marzo";
       break;
       case "04":
       mes = "Abril";
       break;
       case "05":
       mes = "Mayo";
       break;
       case "06":
       mes = "Junio";
       break;
       case  "07":
       mes = "Julio";
       break;
       case  "08":
       mes = "Agosto";
       break;
       case  "09":
       mes = "Septiembre";
       break;
       case  "10":
       mes = "Octubre";
       break;
       case  "11":
       mes = "Noviembre";
       break;
       case  "12":
       mes = "Diciembre";
       break;

   }

   //return mes;

    return document.getElementById("titulo-venta").innerHTML = "Ventas " + mes + " "+ parts[0];
}

function getCurrentHostname() {
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