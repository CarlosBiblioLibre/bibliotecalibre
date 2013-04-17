# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
	$('#new_release').on 'submit', (e) ->
	    $('#release_location').val("#{window.marker.getPosition().toString()}")

	$('#form_submit').attr('disabled', 'disabled');
