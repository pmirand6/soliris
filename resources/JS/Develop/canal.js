/**
 * Created by jgallina on 06/05/2015.
 */
var aplicacion = getCurrentHostname() + '/' + getUrlHTTP();
 $.getScript(aplicacion + '/resources/JS/funciones.min.js', function(){
    // script is now loaded and executed.
    // put your dependent JS here.
    $(document).ready(function() {
    	$('.form')
    	.formValidation({
    		framework: 'bootstrap',
    		excluded: ':disabled',
    		icon: {
    			valid: 'glyphicon glyphicon-ok',
    			invalid: 'glyphicon glyphicon-remove',
    			validating: 'glyphicon glyphicon-refresh'
    		},
    		fields: {
    			nombre: {
    				message: 'El nombre del canal no es válido',
    				validators: {
    					notEmpty: {
    						message: 'El nombre del canal no puede quedar vacío'
    					},
    					stringLength: {
    						min: 2,
    						max: 45,
    						message: 'El nombre del canal debe contener como mínimo 2 y como máximo 45 letras'
    					},
    					regexp: {
    						regexp: /^[0-9a-zA-ZñÑáéíóúÁÉÍÓÚ\s'´.']+$/,
    						message: 'Este campo debe contener solo letras y/o números.'
    					}
    				}
    			},
    			familia: {
    				message: 'La familia no es válida',
    				validators: {
    					stringLength: {
    						min: 3,
    						max: 3,
    						message: 'El formato de la familia debe estar formado por 3 caracteres'
    					}
    				}
    			},
    			direccion: {
    				validators: {
    					stringLength: {
    						min: 4,
    						message: 'La dirección debe contener como mínimo 4 letras'
    					},
    					regexp: {
    						regexp: /^[0-9a-zA-ZñÑáéíóúÁÉÍÓÚ\s'´.'-;–]+$/,
    						message: 'Este campo debe contener solo letras y/o números.'
    					}
    				}
    			},
    			mail: {
    				validators: {
    					emailAddress: {
    						message: 'Por favor, ingrese una dirección de e-mail o deje vacío el campo'
    					},
    					regexp: {
								//regexp: /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/,
								regexp: /^\S+@\S+\.\S+$/, //Validación para doble dominio
								message: 'El formato del e-mail no es válido'
							}
						}
					},
					dir_tec: {
						validators: {
							stringLength: {
								min: 4,
								message: 'El nombre del Director Técnico debe contener como mínimo 4 letras'
							},
							regexp: {
								regexp: /^[0-9a-zA-ZñÑáéíóúÁÉÍÓÚ\s'´.']+$/,
								message: 'Este campo debe contener solo letras y/o números.'
							}
						}
					},
					cont_venta: {
						validators: {
							stringLength: {
								min: 4,
								message: 'El contacto de venta debe contener como mínimo 4 caracteres'
							},
							regexp: {
								regexp: /^[0-9a-zA-ZñÑáéíóúÁÉÍÓÚ\s'´.']+$/,
								message: 'Este campo debe contener solo letras y/o números.'
							}
						}
					},
					cont_otro: {
						validators: {
							stringLength: {
								min: 4,
								message: 'El contacto debe contener como mínimo 4 caracteres'
							},
							regexp: {
								regexp: /^[0-9a-zA-ZñÑáéíóúÁÉÍÓÚ\s'´.']+$/,
								message: 'Este campo debe contener solo letras y/o números.'
							}
						}
					},
					puntos_entrega: {
						validators: {
							stringLength: {
								min: 4,
								message: 'El punto de entrega debe contener como mínimo 4 caracteres'
							},
							regexp: {
								regexp: /^[0-9a-zA-ZñÑáéíóúÁÉÍÓÚ\s'´.'-;–]+$/,
								message: 'Este campo debe contener solo letras y/o números.'
							}
						}
					},
					estado: {
						validators: {
							notEmpty: {
								message: 'El estado no puede quedar vacío'
							}
						}
					}
				}
			})
    	.on('success.form.fv', function(e) {
				// Prevent form submission
				e.preventDefault();

				var parametros = {
					"oper": "Guardar",
					"id": $('#id').val(),
					"nombre": $('#nombre').val(),
					"familia": $('#familia').val(),
					"direccion": $('#direccion').val(),
					"mail": $('#mail').val(),
					"dir_tec": $('#dir_tec').val(),
					"cont_venta": $('#cont_venta').val(),
					"cont_otro": $('#cont_otro').val(),
					
					"estado": $('#estado').val()
				};
				$.ajax({
					url: aplicacion + '/ajax/ajx.canal_form.php',
					type: "POST",
					data: parametros,
					success: function (opciones) {
						if (opciones.indexOf("ERROR")  != 0) {
							alert('Se registró correctamente.\nPuede subir la documentación.');
							//window.location.href = 'http://' + window.location.hostname + '/administrador/docs_canales.php?id=' + opciones;
							window.location.href = aplicacion + '/administrador/docs_canales.php?id=' + opciones;
						}else{
							alert(opciones);
						}
					}
				})
			})
    	.submit(function(e){
    		e.preventDefault();
    	});

    	$('#editDocsCanal').click(function () {
    		window.location.href = 'docs_canales.php?id=' + getQuerystring("id");
    	});
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