//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require semantic-ui
//= require_tree .

$(document).on "turbolinks:load", ->
  $('#kane_summary img')
    .visibility
      type: 'image'
      transition: 'fade in'
      duration: 1000
  $('#kane_summary .card').show()
