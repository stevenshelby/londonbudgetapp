# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#

$(document).ready ->
  hidecharts = () ->
    $('.chart').hide("slow")

  $('#showHowThisWorks').click ->
    hidecharts()
    $('#budget_chart').show("slow")

  $('#nono').click ->
    hidecharts()
    $('#second_chart').show("slow")

