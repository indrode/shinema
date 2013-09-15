# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#movies').dataTable
    sPaginationType: 'full_numbers'
    sDom: '<"top"li>ft<"bottom"p><"clear">'
    iDisplayLength: 100