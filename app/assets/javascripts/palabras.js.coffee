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
    console.log "Elementos: #{id}"
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
    bProcessing: true
    bServerSide: true
    sAjaxSource: $('#palabras').data('source')
