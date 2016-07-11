//= require smartquotes.min
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require semantic-ui
//= require_tree .

$(document).on "turbolinks:load", ->
  smartquotes()
  $('#kane_summary .card').show 0, ->
    $('#kane_summary .card img')
      .visibility
        type: 'image'
        transition: 'fade in'
        duration: 1000
  $('#kane_content .segment').show(0)
  $('#kane_content .rail').show 0, ->
    $('#kane_content .rail img')
      .visibility
        type: 'image'
        transition: 'fade in'
        duration: 1000
