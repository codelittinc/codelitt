# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready =  ->
  console.log "ready"
  # Handle form submit
  $("form").on "ajax:success", (e, data, status, xhr) ->
    alert "You have successfully contacted Codelitt."
  .on "ajax:error", (e, xhr, status, error) ->
    alert "There was an error sending the message, please try again."

  # If field is filled change border color
  $("input").on "change", (e) ->
    value = e.target.value
    if value != ""
      # Blue
      $(e.target.parentNode).addClass('input--filled')
      return
    # Grey
    $(e.target.parentNode).removeClass('input--filled')

  #Click event to scroll to top
  $('.footer-back').click ->
    $('html, body').animate { scrollTop: 0 }, 800
    false



$(document).ready(ready);
$(document).on('page:load', ready);