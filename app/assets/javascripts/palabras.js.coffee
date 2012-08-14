# Palabras
$ ->
  $('#significados').select2
    multiple: true
    placeholder:"Elija sus significados"
    miminumInputLength: 3
    initSelection: (element, callback) ->
      data = []
      newdata = $('#significados').data 'value'
      callback newdata
    ajax:
      url: "/significados.json"
      dataType: 'json'
      data: (term,page) ->
        return {}
      results: (data, page) ->
        newdata = []
        for d in data
          if d['palabra']
            newdata.push id: d['id'], text: d['palabra']
        { results: newdata }
  $('#significados').bind 'change', ->
    id = $(this).val()
    return '' if id or id.empty()
    ids = id.split(',')
    palabras = ''
    ul = "<ul></ul>"
    $('#variantes').empty()
    $('#variantes').append ul
    $(ids).each ->
      $.getJSON "/significados/#{this}.json", (data) ->
        li = "<li>#{data['palabra']}</li>"
        $('#variantes ul').append li


# dataTables script
jQuery ->
  $('#palabras').dataTable
    oLanguage:
      sEmptyTable: "No se encontraron Palabras"
    bProcessing: true
    bServerSide: true
    sAjaxSource: $('#palabras').data('source')

$ ->
  $('#agregar_significado_btn').click ->
    $('#agregar_significado').toggle()
  $('#agregar_significado_form').bind "ajax:complete", ->
    mensaje = 'El significado fue guardado correctamente'
    agregar_mensaje mensaje, 'success'
  $('#agregar_significado_form').bind "ajax:error", ->
    mensaje = 'Hubo un error al intentar guardar el significado'
    agregar_mensaje mensaje, 'error'
    

agregar_mensaje = (msj, tipo) ->
  boton = "<button class=\"close\" data-dismiss=\"alert\">×</button>#{msj}"
  $('.significado_alert').empty()
  div_alert = "<div class='alert alert-#{tipo}'></div>"
  $('.significado_alert').append div_alert
  $('.alert').append boton
  $('#significado_palabra').val ''
