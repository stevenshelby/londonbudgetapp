# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#

$(document).ready ->
  $('#revenue_chart').hide()
  $('#total_chart').hide()

  hidecharts = () ->
    $('.chart').hide("fast")

  $('#expense').click ->
    hidecharts()
    $('#expense_chart').show("slow")

  $('#revenue').click ->
    hidecharts()
    $('#revenue_chart').show("slow")

  $('#total').click ->
    hidecharts()
    $('#total_chart').show("slow")

