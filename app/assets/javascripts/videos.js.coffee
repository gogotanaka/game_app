# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  $('#video_tag_tokens').tokenInput '/tags/index.json',
    theme: 'only'
    prePopulate: $('#video_tag_tokens').data('load')
    resultsFormatter: (item) ->
      return "<li>" + item.name + "</li>"

$ ->
  $(".item").hover(
    -> $(this).find(".like_add_container").show(),
    -> $(this).find(".like_add_container").hide()
  )