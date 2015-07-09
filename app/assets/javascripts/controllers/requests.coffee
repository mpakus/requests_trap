class @Requests
  constructor: ->
    out = $('#requests')
    return unless out.length

    source    = new EventSource(window.stream_path)
    last_data = ''
    source.addEventListener 'results', (e)->
      console.log 'Received a message:', e.data
      if e.data? and e.data != '' and last_data != e.data
        out.prepend(e.data)
        last_data = e.data
