/**
 * Created by jgallina on 30/04/2015.
 */

var aplicacion = getCurrentHostname() + '/' + getUrlHTTP();
$.getScript(aplicacion + '/resources/JS/funciones.min.js', function(){
    // script is now loaded and executed.
    // put your dependent JS here.
	$(document).ready(function() {
	    $('.date').datepicker({
	        format: "yyyy-mm-dd",
	        language: "es",
	        endDate: getDate(),
	        calendarWeeks: true,
	        autoclose: true,
	        clearBtn: true,
	        todayHighlight: true
	    });
	    $('#fecha_venta').change(function () {
	        $('#form_reg_edit').formValidation('revalidateField', 'fecha_venta');
	    });
	    $('#fecha_receta').change(function () {
	        $('#form_reg_edit').formValidation('revalidateField', 'fecha_receta');
	    });

	    $('#form_reg_edit')
	        .formValidation({
				framework: 'bootstrap',
				excluded: ':disabled',
				icon: {
					valid: 'glyphicon glyphicon-ok',
					invalid: 'glyphicon glyphicon-remove',
					validating: 'glyphicon glyphicon-refresh'
				},
				fields: {
					medico: {
						message: 'Seleccione un médico valido',
						validators: {
							notEmpty: {
								message: 'Seleccione un médico valido'
							}
						}
					},
					fecha_venta: {
						validators: {
							date: {
								format: 'YYYY-MM-DD',
								message: 'Formato de fecha invalido'
							}
						}
					},
					fecha_receta: {
						validators: {
							date: {
								format: 'YYYY-MM-DD',
								message: 'Formato de fecha invalido'
							}
						}
					},
					estado: {
						validators: {
							notEmpty: {
								message: 'El Estado del paciente no puede quedar vacío'
							}
						}
					},
					unidades: {
						validators: {
							notEmpty: {
								message: 'Seleccione una unidad'
							}
						}
					},
					dosis: {
						validators: {
							notEmpty: {
								message: 'Seleccione la dosis'
							}
						}
					},
                    canal: {
                        validators: {
                            notEmpty: {
                                message: 'Seleccione un Canal'
                            }
                        }
                    }
				}
	        })

	        .on('success.form.fv', function(e) {
            // Prevent form submission
            e.preventDefault();
						var parametros = {
							"oper" : "Guardar",
							"id" : $("#id").val(),
							"motivo" : $("#motivo").val(),
							"medico" : $("#medico").val(),
							"fecha_venta" : $("#fecha_venta").val(),
							"fecha_receta" : $("#fecha_receta").val(),
							"estado" : $("#estado").val(),
							"unidades" : $("#unidades").val(),
							"dosis" : $("#dosis").val(),
                            "canal" : $("#canal").val()
						};
						$.ajax({
							url: aplicacion + '/ajax/ajx.adm_regs_form.php',
							type: "POST",
							data: parametros,
							success: function (opciones) {
								if (opciones.indexOf("ERROR")  != 0) {
									alert('Se modificó correctamente');
									window.location.href = aplicacion + '/main/panel.php';
								}else{
									alert(opciones);
								}
							}
						});
	        })
			.submit(function(e){
				e.preventDefault();
			})
			
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