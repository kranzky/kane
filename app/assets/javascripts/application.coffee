//= require smartquotes.min
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require semantic-ui
//= require_tree .

$(document).on "turbolinks:load", ->
  smartquotes()
  $('#kane_summary img')
    .visibility
      type: 'image'
      transition: 'fade in'
      duration: 1000
  $('#kane_summary .card').show()
  $('#kane_content .segment').show()
  $('#kane_content .rail').show()
