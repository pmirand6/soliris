/**
 * Created by jgallina on 30/04/2015.
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
    				message: 'El nombre de la institución no es válido',
    				validators: {
    					notEmpty: {
    						message: 'El nombre de la institución no puede quedar vacío'
    					},
    					stringLength: {
    						min: 2,
    						max: 100,
    						message: 'El nombre de la institución debe contener como mínimo 4 y como máximo 100 letras'
    					},
    					regexp: {
    						regexp: /^[0-9a-zA-ZñÑáéíóúÁÉÍÓÚ\s'´.']+$/,
    						message: 'Este campo debe contener solo letras y/o números.'
    					}
    				}
    			},
    			direccion: {
    				validators: {
    					stringLength: {
    						min: 4,
    						message: 'La dirección debe contener como mínimo 4 letras y/o números'
    					},
    					regexp: {
    						regexp: /^[0-9a-zA-ZñÑáéíóúÁÉÍÓÚ\s'´.']+$/,
    						message: 'Este campo debe contener solo letras y/o números.'
    					}
    				}
    			},
    			altura: {
    				validators: {
    					digits: {
    						message: 'La altura solo puede estar formada por números'
    					}
    				}
    			},
    			localidad: {
    				validators: {
    					stringLength: {
    						min: 4,
    						message: 'El localidad debe contener como mínimo 4 letras y/o números'
    					},
    					regexp: {
    						regexp: /^[0-9a-zA-ZñÑáéíóúÁÉÍÓÚ\s'´.']+$/,
    						message: 'Este campo debe contener solo letras y/o números.'
    					}
    				}
    			},
    			provincia: {
    				validators: {
    					stringLength: {
    						min: 4,
    						message: 'El provincia debe contener como mínimo 4 letras'
    					},
    					regexp: {
    						regexp: /^[a-zA-ZñÑáéíóúÁÉÍÓÚ\s'´.']+$/,
    						message: 'Este campo debe contener solo letras.'
    					},

    				}
    			},
    			contacto: {
    				validators: {
    					stringLength: {
    						min: 4,
    						message: 'El contacto debe contener como mínimo 4 letras'
    					},
    					regexp: {
    						regexp: /^[0-9a-zA-ZñÑáéíóúÁÉÍÓÚ\s'´.']+$/,
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
					telefono: {
						validators: {
							regexp: {
								regexp: /^[0-9 -]+$/,
								message: 'Este campo debe contener solo números. Puede utilizar como separador el símbolo "-".'
							},
							stringLength: {
								min: 8,
								message: 'El teléfono debe tener como mínimo 8 números'
							}
						}
					},
					notas: {
						message: 'La nota de la institución no es válida',
						validators: {
							stringLength: {
								min: 4,
								max: 500,
								message: 'La nota de la institución debe contener como mínimo 4 y como máximo 500 letras'
							},
							regexp: {
								regexp: /^[0-9a-zA-ZñÑáéíóúÁÉÍÓÚ\s'´.']+$/,
								message: 'Este campo debe contener solo letras y/o números. Símbolos admitidos: ",.-´"'
							}
						}
					},
					tipo: {
						message: 'El tipo de institución no es válido',
						validators: {
							stringLength: {
								min: 2,
								max: 50,
								message: 'El tipo de institución debe contener como mínimo 2 y como máximo 50 letras'
							},
							regexp: {
								regexp: /^[a-zA-ZñÑáéíóúÁÉÍÓÚ\s'´.']+$/,
								message: 'Este campo debe contener solo letras.'
							},
						}
					},
					estado: {
						validators: {
							notEmpty: {
								message: 'El Estado de la institucion no puede quedar vacío'
							}
						}
					},
				}
			})
    	.on('success.form.fv', function(e) {
	            // Prevent form submission
	            e.preventDefault();

	            var parametros = {
	            	"oper": "Guardar",
	            	"id": $('#id').val(),
	            	"nombre": $('#nombre').val(),
	            	"direccion": $('#direccion').val(),
	            	"altura": $('#altura').val(),
	            	"localidad": $('#localidad').val(),
	            	"provincia": $('#provincia').val(),
	            	"contacto": $('#contacto').val(),
	            	"mail": $('#mail').val(),
	            	"telefono": $('#telefono').val(),
	            	"notas": $('#notas').val(),
	            	"tipo": $('#tipo').val(),
	            	"estado": $('#estado').val(),
	            	"familia": $('#familia').val()
	            };
	            $.ajax({
	            	url: aplicacion + '/ajax/ajx.institucion_form.php',
	            	type: "POST",
	            	data: parametros,
	            	success: function (opciones) {
	            		if (opciones.indexOf("ERROR")  != 0) {
	            			alert('Se registró correctamente, ya puede cerrar esta ventana');
	            			window.location.replace(aplicacion + '/administrador/instituciones.php');
	            		}else{
	            			alert(opciones);
	            			window.location.replace(aplicacion + '/administrador/instituciones.php');
	            		}
	            	}
	            });
	        })
    	.submit(function(e){
    		e.preventDefault();
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