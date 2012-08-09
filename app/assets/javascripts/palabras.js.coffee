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
  
