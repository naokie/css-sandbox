displayResult = (data) ->
  $('<a />').attr(
    'href': data.url
    'target': '_blank'
  ).text(data.url).appendTo('#title')
  $('<span />').text("#{data.count} users tweet").appendTo('#count')

  @

$ ->
  $('#reloadButton').on 'click', ->
    $('#title, #count, #screenshot, #comment').empty()
    $.getJSON 'http://urls.api.twitter.com/1/urls/count.json?url=' + $('#appendedInputButton').val() + '&callback=?', (data) ->
      displayResult(data)

  @
