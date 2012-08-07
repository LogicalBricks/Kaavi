# Palabras
$ ->
  $('#significados').select2
    multiple: true
    placeholder:"Elija sus significados"
    allowClear: true
    miminumInputLength: 1
    ajax:
      url: "/significados.json"
      dataType: 'json'
      data: (term, page) ->
        { }
      results: (data, page) ->
        i['text'] = i['palabra'] for i in data
        console.log data
        { results: data }
