displayResult = (data) ->
  $('<a />').attr(
    'href': data.url
    'target': '_blank'
  ).text(data.title).appendTo('#title')
  $('<a />').attr(
    'href': data.entry_url
    'target': '_blank'
  ).text("#{data.count} users").appendTo('#count')
  $('<img />').addClass('thumbnail').attr('src', data.screenshot).appendTo('#screenshot')

  commentContent = ""
  for bookmark in data.bookmarks
    do (bookmark) ->
      commentContent += "<dt>#{bookmark.user}</dt><dd>#{bookmark.comment}</dd>" unless bookmark.comment is ""
  $('#comment').html(commentContent)

  @

$ ->
  $('#reloadButton').on 'click', ->
    $('#title, #count, #screenshot, #comment').empty()
    $.getJSON 'http://b.hatena.ne.jp/entry/json/?url=' + $('#appendedInputButton').val() + '&callback=?', (data) ->
      displayResult(data)

  @
