# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $("form").on "ajax:success", (e, data, status, xhr) ->
    alert "You have successfully contacted Codelitt."
  .on "ajax:error", (e, xhr, status, error) ->
    alert "There was an error sending the message, please try again."