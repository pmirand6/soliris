/**
 * Created by jgallina on 30/04/2015.
 */
$.getScript(getCurrentHostname() + '/soliris/resources/JS/funciones.min.js', function(){
    // script is now loaded and executed.
    // put your dependent JS here.
    $(document).ready(function() {

       var matricula = $("#matricula_numero").val();
       console.log(matricula);

        $('.date').datepicker({
            format: "dd/mm/yyyy",
            language: "es",
			//startDate: '-2y',
            endDate: getDate(),
            calendarWeeks: true,
            autoclose: true,
            clearBtn: true,
            todayHighlight: true
        });

        $('#nacimiento').change(function () {
            $('.form').formValidation('revalidateField', 'nacimiento');
        });
        $('#fecha_cap').change(function () {
            $('.form').formValidation('revalidateField', 'fecha_cap');
        });

		/*$('.fecha_cap').datepicker({
            format: "dd-MM-YYYY",
            language: "es",
            //endDate: getDate(),
            calendarWeeks: true,
            autoclose: true,
            clearBtn: true,
            todayHighlight: true
        });*/

		
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
                        message: 'El nombre del médico no es válido',
                        validators: {
                            notEmpty: {
                                message: 'El nombre del médico no puede quedar vacío'
                            },
                            stringLength: {
                                min: 4,
                                max: 100,
                                message: 'El nombre del médico debe contener como mínimo 4 y como máximo 100 letras'
                            }
                        }
                    },
                    matricula_tipo: {
                        validators: {
                            notEmpty: {
                                message: 'Debe Seleccionar el Tipo de Matricula'
                            }
                        }
                    },
                    matricula_numero: {
                        validators: {
                            digits: {
                                message: 'El número de matricula solo puede estar formada por digitos'
                            },
                            notEmpty: {
                                message: 'El número de matricula no puede quedar vacío'
                            }
                        }
                    },
                    lugar: {
                        validators: {
                            notEmpty: {
                                message: 'El lugar no puede quedar vacío'
                            }
                        }
                    },
                    c_atencion: {
                        validators: {
                            stringLength: {
                                min: 4,
                                message: 'El centro de atención debe contener como mínimo 4 letras'
                            }
                        }
                    },
                    telefono: {
                        validators: {
                            stringLength: {
                                min: 8,
                                message: 'El teléfono debe tener como mínimo 8 números'
                            }/*, DC001
                            digits: {
                                message: 'El teléfono solo puede estar formado por digitos'
                            }*/
                        }
                    },
                    fax: {
                        validators: {
                            stringLength: {
                                min: 8,
                                message: 'El fax debe tener como mínimo 8 números'
                            },
                            digits: {
                                message: 'El fax solo puede estar formado por digitos'
                            }
                        }
                    },
					email: {
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
                    domicilio: {
                        validators: {
                            stringLength: {
                                min: 4,
                                message: 'El domicilio debe contener como mínimo 4 letras'
                            }
                        }
                    },
                    localidad: {
                        validators: {
                            stringLength: {
                                min: 4,
                                message: 'El localidad debe contener como mínimo 4 letras'
                            }
                        }
                    },
                    fecha_cap: {
                         validators: {
                            notEmpty: {
                                message: 'la fecha de capacitacion no puede quedar vacío'
                            },
                            date: {
                                format: 'DD/MM/YYYY',
                                message: 'Formato de fecha invalido'
                            }
                        }
                    },
                    especialidad: {
                        validators: {
                            notEmpty: {
                                message: 'La especialidad no puede quedar vacía'
                            }
                        }
                    },
                    apm: {
                        validators: {
                          notEmpty: {
                              message: 'El APM asignado al médico no puede quedar vacío'
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
                    "id" : $("#id").val(),
                    "nombre" : $("#nombre").val(),
                    "apellidos" : $("#apellido").val(),
                    "matricula_tipo" : $("#matricula_tipo").val(),
                    "matricula_numero" : $("#matricula_numero").val(),
                    "lugar" : $("#lugar").val(),
                    "c_atencion" : $("#c_atencion").val(),
                    "telefono" : $("#telefono").val(),
                    "fax" : $("#fax").val(),
					"email" : $("#email").val(),
                    "domicilio" : $("#domicilio").val(),
                    "localidad" : $("#localidad").val(),
                    
                    "especialidad" : $("#especialidad").val(),
                    "apm" : $("#apm").val(),
                    "u_venta" : $("#u_venta").val(),
                    "estado" : $("#estado").val()
                };
                
                $.ajax({
                    url: getCurrentHostname() + '/soliris/ajax/ajx.medico_form.php',
                    type: "POST",
                    data: parametros,
                    success: function (opciones) {
                        if (opciones.indexOf("ERROR")  != 0) {
                            alert('Se registró correctamente.\t Continue con la carga de la documentacion.');
                            window.location.href = getCurrentHostname() + '/soliris/administrador/docs_medico.php?id=' + opciones;
                        }else{
                            alert(opciones);
                        }
                    }
                });
            })
            .submit(function(e){
                e.preventDefault();
            });

        $('#estado').change(function () {
            if($("#estado").val() != ''){
                $('#icon_estado').removeClass();
                $('#icon_estado').addClass('TBL TBL-' + $("#estado").val().replace(" ", "_"));
            }else{
                $('#icon_estado').removeClass();
                $('#icon_estado').addClass('fa fa-check-circle-o');
            }
        });

        $('#editDocs').click(function () {
            window.location.href = getCurrentHostname() + '/soliris/administrador/docs_medico.php?id=' + getQuerystring("id");
        });

        $('#histDocs').click(function () {
            window.location.href = getCurrentHostname() + '/soliris/administrador/docs_hist_medico.php?id=' + getQuerystring("id");
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