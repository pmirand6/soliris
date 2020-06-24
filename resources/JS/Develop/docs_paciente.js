/**
 * Created by jgallina on 20/04/2015.
 */
var aplicacion = `${getCurrentHostname()}/${getUrlHTTP()}`
var paramPaciente = JSON.parse(window.localStorage.getItem('paramPaciente'))
var flagDocumento
var flagRespuesta = true
var vacunacion = $('#file_consentimiento').uploadFile({
  url: `${aplicacion}/ajax/ajx.docs_paciente.php`,
  autoSubmit: false,
  dragDrop: false,
  fileName: 'myfile',
  allowedTypes: 'jpg,png,gif,doc,pdf,zip,bmp,tif',
  returnType: 'json',
  dragDropStr: '<span><b>Arrastre y suelte el archivo...</b></span>',
  maxFileCount: 1,
  multiple: false,
  formData: {
    idPac: paramPaciente.idPac,
    referencia: 'Paciente',
    tipoDoc: 'Vacunacion',
    oper: 'saveDocPac',
  },
  dynamicFormData() {
    var data = { f_doc_vac: getFechaValue('f_doc_vac') }
    return data
  },
  onSubmit() {
    validateFiles()
    // $('.form').formValidation('revalidateField', 'f_doc_vac')
  },
  onSelect() {
    $('#bot_up_doc').prop('disabled', false).removeClass('disabled') // Element(s) are now enabled.
  },
  onError(files, status, errMsg, pd) {
    // files: list of files
    // status: error status
    // errMsg: error message
    alert(status + errMsg)
  },
})
var consentimiento = $('#file_otro').uploadFile({
  url: `${aplicacion}/ajax/ajx.docs_paciente.php`,
  autoSubmit: false,
  dragDrop: false,
  fileName: 'myfile',
  allowedTypes: 'jpg,png,gif,doc,pdf,zip,bmp,tif',
  returnType: 'json',
  dragDropStr: '<span><b>Arrastre y suelte el archivo...</b></span>',
  multiple: false,
  maxFileCount: 1,
  formData: {
    idPac: paramPaciente.idPac,
    referencia: 'Paciente',
    tipoDoc: 'Consentimiento',
    oper: 'saveDocPac',
  },
  dynamicFormData() {
    var data = {
      f_doc_consentimiento: getFechaValue('f_doc_otro'),
    }
    return data
  },
  onSubmit() {
    validateFiles()
    // $('.form').formValidation('revalidateField', 'f_doc_otro')
  },
  onSelect() {
    $('#bot_up_doc').prop('disabled', false).removeClass('disabled') // Element(s) are now enabled.
  },
  onError(files, status, errMsg, pd) {
    // files: list of files
    // status: error status
    // errMsg: error message
    alert(status + errMsg)
  },
})

function upForm() {
  vacunacion.startUpload()
  consentimiento.startUpload()
  sendMailAltaPaciente()
  Swal.fire({
    title: 'Registro Correcto',
    text: 'El paciente será dictaminado por el área de FV. Hasta entonces, quedará en estado pendiente',
    icon: 'success',
    showCancelButton: false,
    confirmButtonColor: '#3085d6',
    confirmButtonText: 'Ok',
  }).then((result) => {
    if (result.value) {
      window.location.href = `${aplicacion}/administrador/pacientes.php?id=${paramPaciente.idPac}`
    }
  })
}

function validateFiles() {
  if (consentimiento.getFileCount() === 1 && vacunacion.getFileCount() === 1) {
    upForm()
  } else {
    Swal.fire('Error', 'Verifique que haya cargado los documentos de Vacunación y Consentimiento', 'error')
    $('#bot_up_doc').attr('disabled', true)
  }
}

function formValidate() {
  $('.form')
    .formValidation({
      framework: 'bootstrap',
      excluded: ':disabled',
      icon: {
        required: 'fa fa-asterisk',
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh',
      },
      fields: {
        f_doc_vac: {
          validators: {
            date: {
              format: 'DD-MM-YYYY',
              message: 'El formato es invalido',
            },
            notEmpty: {
              message: 'La Fecha del Documento de vacunación no puede quedar vacía',
            },
          },
        },
        f_doc_otro: {
          validators: {
            date: {
              format: 'DD-MM-YYYY',
              message: 'El formato es invalido',
            },
            notEmpty: {
              message: 'La Fecha del Documento de Consentimiento no puede quedar vacía',
            },
          },
        },
      },
    })
    .on('success.form.fv', function (e) {
      e.preventDefault()
      validateFiles()
    })
    .submit(function (e) {
      e.preventDefault()
    })
}

$.getScript(`${aplicacion}/resources/JS/funciones.min.js`, function () {
  // script is now loaded and executed.
  // put your dependent JS here.

  $(document).ready(function () {
    $('.date').datepicker({
      format: 'dd-mm-yyyy',
      language: 'es',
      endDate: getDate(),
      calendarWeeks: true,
      autoclose: true,
      clearBtn: true,
      todayHighlight: true,
    })
    formValidate()

    $('#f_doc_vac').on('change', function () {
      $('.form').formValidation('revalidateField', 'f_doc_vac')
    })

    $('#f_doc_otro').on('change', function () {
      $('.form').formValidation('revalidateField', 'f_doc_otro')
    })

    $('#Docs').click(function () {
      if (getQuerystring('id') != '') {
        const $btn = $(this).button('loading')
        window.location.href = `${aplicacion}/administrador/paciente.php?id=${paramPaciente.idPac}`
        $btn.button('reset')
      }
    })
  })
})

function sendMailAltaPaciente() {
  if (getQuerystring('accion') == 'alta') {
    $.post(
      `${aplicacion}/ajax/ajx.paciente.php`,
      {
        oper: 'sendEmailPaciente',
        idPac: paramPaciente.idPac,
        accion: 'Alta de Paciente',
      },
      function (data, textStatus, jqXHR) {},
      'dataType'
    )
  }
}

// Documentacion Paciente modificado se debe actualizar el estado a Pendiente
// para que sea revisada la documentacion por FV

function DocPacModified() {
  var parametros = {
    oper: 'DocPacModified',
    id: $('#id').val(),
  }
  $.ajax({
    url: `${aplicacion}/ajax/ajx.docs_paciente.php`,
    type: 'POST',
    data: parametros,
    async: false,
    success(opciones) {
      if (opciones.indexOf('ERROR') != 0) {
        alert('Se registró correctamente, ya puede cerrar esta ventana')

        $.post(
          `${aplicacion}/ajax/ajx.paciente.php`,
          {
            oper: 'sendEmailPaciente',
            idPac: $('#id').val(),
            accion: 'Paciente Modificado',
          },
          function (data, textStatus, jqXHR) {},
          'dataType'
        )
        setTimeout(function () {
          window.location.href = `${aplicacion}/administrador/docs_paciente.php?id=${opciones}`
        }, 3000)
      } else {
        alert(opciones)
      }
    },
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

function getFechaValue($id) {
  return $(`#${$id}`).val()
}

function getQuerystring(key, default_) {
  if (default_ == null) default_ = ''
  key = key.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]')
  var regex = new RegExp(`[\\?&]${key}=([^&#]*)`)
  var qs = regex.exec(window.location.href)
  if (qs == null) return default_
  return qs[1]
}
