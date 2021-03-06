// VARIABLES GLOBALES
// FIXME VERIFICAR ESTA VARIABLE
var grupo_usuario = '' // VARIABLE DE GRUPO DE USUARIO
var aplicacion = `${getCurrentHostname()}/${getUrlHTTP()}`
var idPac

var fv

$.getScript(`${aplicacion}/resources/JS/funciones.min.js`, function () {
  $(document).ready(function () {
    const fileReceta = document.querySelector('#divFileReceta input[type=file]')
    fileReceta.onchange = () => {
      if (fileReceta.files.length > 0) {
        const fileName = document.querySelector('#divFileReceta .file-name')
        fileName.textContent = fileReceta.files[0].name
        $('#fileRecetaPreviewShow').on('click', function () {
          window.open(window.URL.createObjectURL(fileReceta.files[0]))
        })
      }
    }

    const fileOtro = document.querySelector('#divFileOtro input[type=file]')
    fileOtro.onchange = () => {
      if (fileOtro.files.length > 0) {
        const fileNameOtro = document.querySelector('#divFileOtro .file-name')
        fileNameOtro.textContent = fileOtro.files[0].name
        $('#fileOtroPreviewShow').on('click', function () {
          window.open(window.URL.createObjectURL(fileOtro.files[0]))
        })
      }
    }

    $('#nv').window({
      modal: true,
      closed: true,
      minimizable: false,
      maximizable: false,
      title: 'Nueva Operación',
      closeOnEscape: true,
      draggable: false,
      maximized: true,
      inline: true,
      collapsible: false,
      constrain: true,
      onBeforeClose() {
        window.location.href = window.location.href
      },
    })
    $('.panel-tool-close').click(function () {
      window.location.href = window.location.href
    })
    l_set_select_medico()
    l_set_select_canal()
    l_set_select_institucion()
    l_set_datepicker()
    l_validate_form()
    l_set_producto()
    l_set_paciente()

    $('#f_receta').change(function (e) {
      // e.preventDefault();

      if (this.value != '') {
        $.ajax({
          type: 'POST',
          url: `${aplicacion}/ajax/ajx.docs_venta.php`,
          data: {
            oper: 'checkDocFechaVenta',
            f_receta: this.value,
            idPac: getQuerystring('idPac'),
          },
          dataType: 'json',
          success(response) {
            Swal.fire({
              title: response.title,
              icon: response.icon,
              html: response.html,
            })
          },
        })
      }
    })

    $('#canVenta').click(function (e) {
      e.preventDefault()
      parent.location.reload()
    })
  })
})

function previewReceta() {}

function readURL(input) {
  if (input.files && input.files[0]) {
  }
}
function l_generar_venta() {
  const myForm = document.getElementById('frmVenta')
  var form = new FormData(myForm)
  form.append('oper', 'guardar_venta')
  form.append('idProducto', $('#producto').val())
  form.append('idPac', getQuerystring('idPac'))
  form.append('idMedico', $('#medico').data('id'))
  form.append('cantUnidades', $('#cantDosis').val())
  form.append('idInstitucion', $('#institucion').data('id'))
  form.append('idCanal', $('#canal').data('id'))
  form.append('idPresentacion', $('#presentacion').val())
  form.append('oc', $('#oc').val())

  var settings = {
    url: `${aplicacion}/ajax/ajx.generar_venta.php`,
    method: 'POST',
    processData: false,
    mimeType: 'multipart/form-data',
    contentType: false,
    data: form,
  }

  if ($('#oc').val() == '') {
    Swal.fire({
      title: 'Orden de Compra',
      text: 'No se especificó una orden de compra, desea continuar',
      icon: 'question',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Cargar Venta',
      cancelButtonText: 'No',
    }).then((result) => {
      if (result.value) {
        $.ajax(settings).done(function (response) {
          const data = JSON.parse(response)
          console.log(data)
          Swal.fire({
            showCancelButton: false,
            confirmButtonColor: '#3085d6',
            confirmButtonText: 'OK',
            title: data.title,
            icon: data.icon,
            html: data.text,
          }).then((result) => {
            if (result.value) {
              parent.location.reload()
            }
          })
        })
      }
    })
  } else {
    $.ajax(settings).done(function (response) {
      const data = JSON.parse(response)
      console.log(data)
      Swal.fire({
        showCancelButton: false,
        confirmButtonColor: '#3085d6',
        confirmButtonText: 'OK',
        title: data.title,
        icon: data.icon,
        html: data.text,
      }).then((result) => {
        if (result.value) {
          parent.location.reload()
        }
      })
    })
  }
}

function l_set_paciente() {
  $.post(
    `${aplicacion}/ajax/ajx.paciente.php`,
    { oper: 'showPaciente', id: getQuerystring('idPac') },
    function (data) {
      $.map(data, function (e) {
        $('#nombrePaciente').html(e.nombre_completo)
      })
    },
    'json'
  )
}

function l_set_producto() {
  $.getJSON(`${aplicacion}/ajax/ajx.producto.php`, { oper: 'getproducto' }, function (data, textStatus, jqXHR) {
    $.each(data, function (i, v) {
      $('#producto').val(v.id)
      $('#productoTitle').html(v.valor)
      l_set_select_presentacion(v.id)
    })
  })
}

function l_validate_form() {
  const noExiste = function () {
    return {
      validate(input) {
        return {
          valid: false,
          message: '* No se encontraron coincidencias',
        }
      },
    }
  }

  const dateValidators = {
    validators: {
      date: {
        format: 'DD-MM-YYYY',
        message: 'El formato es invalido',
      },
      notEmpty: {
        message: 'Debe indicar una fecha para este Documento',
      },
    },
  }

  const fileValidators = {
    validators: {
      notEmpty: {
        message: 'Debe Seleccionar un Archivo',
      },
      file: {
        extension: 'jpg,png,gif,doc,pdf,zip,bmp,tif',
        type:
          'image/jpeg,image/png,image/gif,application/msword,application/pdf,application/zip,image/x-ms-bmp,image/tiff',
        maxSize: 12097152, // 2048 * 1024
        message: 'El archivo seleccionado no es válido',
      },
    },
  }

  // Registrando custom validator
  FormValidation.validators.noExiste = noExiste

  // Instancia del form
  fv = FormValidation.formValidation(document.getElementById('frmVenta'), {
    fields: {
      medico: {
        validators: {
          noExiste: {
            enable: false,
          },
          stringLength: {
            min: 3,
            message: 'Ingrese más de 3 letras',
          },
          checkMedico: {
            message: 'Seleccione un médico del Listado',
            callback(input) {
              const medicoSelected = document.getElementById('frmVenta').querySelector('[name="medicoSelected"]').value
              if (input == '' && medicoSelected == '') {
                return true
              }
              return input.value == medicoSelected
            },
          },
        },
      },
      presentacion: {
        validators: {
          notEmpty: {
            message: 'Debe seleccionar una dosís',
          },
        },
      },
      cantDosis: {
        message: 'El nombre de la ciudad no es válida',
        validators: {
          regexp: {
            regexp: /^[0-9]*$/,
            message: 'Este campo debe contener solo números.',
          },
          greaterThan: {
            min: 1,
            message: 'El valor indicado debe ser mayor a 0',
          },
          notEmpty: {
            message: 'Debe indicar la cantidad de Dosis',
          },
        },
      },
      canal: {
        validators: {
          noExiste: {
            enable: false,
          },
          stringLength: {
            min: 3,
            message: 'Ingrese más de 3 letras',
          },
          checkCanal: {
            message: 'Seleccione un canal del Listado',
            callback(input) {
              const canalSelected = document.getElementById('frmVenta').querySelector('[name="canalSelected"]').value
              if (input == '' && canalSelected == '') {
                return true
              }
              return input.value == canalSelected
            },
          },
        },
      },
      institucion: {
        validators: {
          noExiste: {
            enable: false,
          },
          stringLength: {
            min: 3,
            message: 'Ingrese más de 3 letras',
          },
          checkInstitucion: {
            message: 'Seleccione una Institución del Listado',
            callback(input) {
              const institucionSelected = document
                .getElementById('frmVenta')
                .querySelector('[name="institucionSelected"]').value
              if (input == '' && institucionSelected == '') {
                return true
              }
              return input.value == institucionSelected
            },
          },
        },
      },
      f_receta: dateValidators,
      file_receta: fileValidators,
    },
    plugins: {
      alias: new FormValidation.plugins.Alias({
        // These checkers are treated as callback validator
        checkMedico: 'callback',
        checkInstitucion: 'callback',
        checkCanal: 'callback',
      }),
      trigger: new FormValidation.plugins.Trigger(),
      bulma: new FormValidation.plugins.Bulma(),
      submitButton: new FormValidation.plugins.SubmitButton(),
      icon: new FormValidation.plugins.Icon({
        valid: 'fa fa-check',
        invalid: 'invalid-fv fa fa-times',
        validating: 'fa fa-refresh',
      }),
    },
  })
    .on('core.field.invalid', function (e) {
      if (e == 'file_receta') {
        l_ResetFileReceta()
      }
      if (e == 'file_otro') {
        l_ResetFileOtro()
      }
    })
    .on('core.field.valid', function (e) {
      if (e == 'file_receta') {
        l_setValidatedReceta()
      }
      if (e == 'file_otro') {
        l_setValidatedOtro()
      }
    })
    .on('core.form.valid', function () {
      $('#divFileReceta').removeClass('is-danger').addClass('is-succes')
      if ($('file_otro' !== '')) {
        $('#divFileReceta').removeClass('is-danger').addClass('is-succes')
      }
      l_generar_venta()
    })
    .on('core.field.added', function (e) {})

  $('#btnAddDoc').click(function (e) {
    $('#divOtroDocumento').show()
    $('#divAddDoc').hide()
    fv.addField('f_otro', dateValidators).addField('file_otro', fileValidators)
  })
  $('#f_otro').change(function () {
    fv.revalidateField('f_otro')
  })
  $('#file_otro').change(function () {
    fv.revalidateField('file_otro')
  })

  $('#btnRemDoc').click(function (e) {
    $('#divOtroDocumento').hide()
    $('#divAddDoc').show()
    fv.removeField('f_otro', dateValidators).removeField('file_otro', fileValidators)
  })

  $('#fileRecetaPreviewDelete').click(function (e) {
    e.preventDefault()

    $('#file_receta').val('')
    l_ResetFileReceta()
  })

  $('#fileOtroDelete').click(function (e) {
    e.preventDefault()
    $('#file_otro').val('')
    l_ResetFileOtro()
  })
}

function l_setValidatedOtro() {
  $('#btnOtroActions').show()
  $('#iconFileOtro').addClass('fa-check')
  $('#iconFileOtro').removeClass('fa-exclamation-circle')
  $('i[data-field="file_otro"').removeClass('fa-check')
  $('#iconFileOtro').removeClass('fa-upload').addClass('fa-check')
  $('#divFileOtro').removeClass('is-danger').addClass('is-success')
}

function l_setValidatedReceta() {
  $('#btnRecetaActions').show()
  $('#iconReceta').addClass('fa-check')
  $('#iconReceta').removeClass('fa-exclamation-circle')
  $('i[data-field="file_receta"').removeClass('fa-check')
  $('#iconReceta').removeClass('fa-upload').addClass('fa-check')
  $('#divFileReceta').removeClass('is-danger').addClass('is-success')
}

function l_ResetFileOtro() {
  $('#btnOtroActions').hide()
  $('#iconFileOtro').removeClass('fa-check')
  $('#iconFileOtro').addClass('fa-exclamation-circle')
  $('#divFileOtro .file-name').html('Seleccione Documento')
  $('i[data-field="file_otro"').removeClass('fa-times')
  $('i[data-field="file_otro"').addClass('fa-error')
  $('#divFileOtro').removeClass('is-info').addClass('is-danger')
}

function l_ResetFileReceta() {
  $('#btnRecetaActions').hide()
  $('#iconReceta').removeClass('fa-check')
  $('#iconReceta').addClass('fa-exclamation-circle')
  $('#divFileReceta .file-name').html('Seleccione Documento')
  $('i[data-field="file_receta"').removeClass('fa-times')
  $('#divFileReceta').removeClass('is-info').addClass('is-danger')
}

function l_set_datepicker() {
  $('.date').datepicker({
    format: 'dd-mm-yyyy',
    language: 'es',
    endDate: getDate(),
    calendarWeeks: true,
    autoclose: true,
    clearBtn: true,
    todayHighlight: true,
  })
}

function l_set_select_medico() {
  $('#helpMedico').addClass('is-success')
  $('#helpMedico').html('* Comience a escribir para seleccionar un médico')
  $('#medico').keyup(function () {
    var minlength = 3
    var searchField = $('#medico').val()
    var regex = new RegExp(searchField, 'i')
    var output = '<div class="list is-hoverable">'
    var count = 1
    var url_json = `${aplicacion}/ajax/ajx.medicos.php?q=${searchField}`
    if (searchField != null && searchField.length >= minlength) {
      $.getJSON(url_json, function (data) {
        if (data.length != 0) {
          fv.disableValidator('medico', 'noExiste').revalidateField('medico')
          $.each(data, function (key, val) {
            if (val.text.search(regex) != -1) {
              output += `<a class="list-item" id="span_medico" name="span_medico" data-id="${val.id}">${val.text}`
              if (count % 2 == 0) {
                output += '</a>'
              }
              count++
            }
          })
          output += '</div>'
          $('#result_medicos').html(output)
        } else {
          $('#helpMedico').removeClass('is-success')
          $('#helpMedico').addClass('is-danger')
          fv.enableValidator('medico', 'noExiste').revalidateField('medico')
          $('#helpMedico').html('')
          $('#result_medicos').html('')
        }
      })
    } else if (searchField.length < minlength) {
      $('#result_medicos').html('')
    }
  })

  $(document).on('click', '#span_medico', function () {
    var idMedico = $(this).attr('data-id').toLowerCase()
    var n_medico = $(this).text()
    $('#medico').data('id', idMedico)
    $('#medico').val(n_medico)
    $('#medicoSelected').val(n_medico)
    if ($('#medico').val() == n_medico) {
      fv.disableValidator('medico', 'noExiste').revalidateField('medico')
      $('#helpMedico').html('')
    } else {
      fv.enableValidator('medico', 'noExiste').revalidateField('medico')
    }
    $('#result_medicos').html('')
  })
}

function l_set_select_canal() {
  $('#helpCanal').addClass('is-success')
  $('#helpCanal').html('* Comience a escribir para seleccionar un Canal')
  $('#canal').keyup(function () {
    var minlength = 3
    var searchField = $('#canal').val()
    var regex = new RegExp(searchField, 'i')
    var output = '<div class="list is-hoverable">'
    var count = 1
    var url_json = `${aplicacion}/ajax/ajx.canales.php?q=${searchField}`
    if (searchField != null && searchField.length >= minlength) {
      $.getJSON(url_json, function (data) {
        if (data.length != 0) {
          fv.disableValidator('canal', 'noExiste').revalidateField('canal')
          $.each(data, function (key, val) {
            if (val.text.search(regex) != -1) {
              output += `<a class="list-item" id="span_canal" data-id="${val.id}">${val.text}`
              if (count % 2 == 0) {
                output += '</a>'
              }
              count++
            }
          })
          output += '</div>'
          $('#result_canal').html(output)
        } else {
          fv.enableValidator('canal', 'noExiste').revalidateField('canal')
          $('#result_canal').html('')
          $('#helpCanal').html('')
          $('#helpCanal').removeClass('is-success')
          $('#helpCanal').addClass('is-danger')
          $('#helpCanal').html('')
        }
      })
    } else if (searchField.length + 1 < minlength) {
      $('#result_canal').html('')
    }
  })

  $(document).on('click', '#span_canal', function () {
    var idCanal = $(this).attr('data-id').toLowerCase()
    var n_canal = $(this).text()
    $('#canal').data('id', idCanal)
    $('#canal').val(n_canal)
    $('#canalSelected').val(n_canal)
    if ($('#canal').val() == n_canal) {
      fv.disableValidator('canal', 'noExiste').revalidateField('canal')
      $('#helpCanal').html('')
    } else {
      fv.enableValidator('canal', 'noExiste').revalidateField('canal')
    }
    $('#result_canal').html('')
  })
}

function l_set_select_institucion() {
  $('#helpInstitucion').addClass('is-success')
  $('#helpInstitucion').html('* Comience a escribir para seleccionar una Institución')
  $('#institucion').keyup(function () {
    var minlength = 3
    var searchField = $('#institucion').val()
    var regex = new RegExp(searchField, 'i')
    var output = '<div class="list is-hoverable">'
    var count = 1
    var url_json = `${aplicacion}/ajax/ajx.instituciones.php?q=${searchField}`
    if (searchField != null && searchField.length >= minlength) {
      $.getJSON(url_json, function (data) {
        if (data.length != 0) {
          fv.disableValidator('institucion', 'noExiste').revalidateField('institucion')
          $.each(data, function (key, val) {
            if (val.text.search(regex) != -1) {
              output += `<a class="list-item" id="span_institucion" data-id="${val.id}">${val.text}`
              if (count % 2 == 0) {
                output += '</a>'
              }
              count++
            }
          })
          output += '</div>'
          $('#result_institucion').html(output)
        } else {
          fv.enableValidator('institucion', 'noExiste').revalidateField('institucion')
          $('#result_institucion').html('')
          $('#helpInstitucion').html('')
          $('#helpInstitucion').removeClass('is-success')
          $('#helpInstitucion').addClass('is-danger')
        }
      })
    } else if (searchField.length + 1 < minlength) {
      $('#result_institucion').html('')
    }
  })

  $(document).on('click', '#span_institucion', function () {
    var idInstitucion = $(this).attr('data-id').toLowerCase()
    var n_institucion = $(this).text()
    $('#institucion').data('id', idInstitucion)
    $('#institucion').val(n_institucion)
    $('#institucionSelected').val(n_institucion)
    if ($('#institucion').val() == n_institucion) {
      fv.disableValidator('institucion', 'noExiste').revalidateField('institucion')
      $('#helpInstitucion').html('')
    } else {
      fv.enableValidator('institucion', 'noExiste').revalidateField('institucion')
    }
    $('#result_institucion').html('')
  })
}

function l_set_select_presentacion($producto) {
  $.getJSON(`${aplicacion}/ajax/ajx.presentacion.php`, { oper: 'getPresentacion', producto: $producto }, function (
    data
  ) {
    var items = []
    $.each(data, function (key, val) {
      items.push(`<option value='${val.id}'>${val.valor}</option>`)
    })
    $('#presentacion').append(items)
  })
}

function getCurrentHostname() {
  var protocolo
  var url
  var var_port
  var port

  protocolo = window.location.protocol
  url = window.location.hostname
  var_port = window.location.port

  if (var_port !== '') {
    port = `:${var_port}`
  } else {
    port = ''
  }

  return `${protocolo}//${url}${port}`
}

function getUrlHTTP() {
  var path = window.location.pathname
  var appName = path.split('/')
  return appName[1]
}
