# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$ ->
	$('#vote1' ).on 'click', (e) ->
		if $.cookie 'vote'
			console.log ("Ya votaste!")
		else
			$.cookie('vote', 'vote', { expires: 1 })
			$.ajax '/vota/'+$('#battle').data('battle')+'/1',
				type: 'GET'
				dataType: 'html'
				success: (data, status, xhr) ->
					console.log "hola1"
				error: (jqXHR, textStatus, errorThrown) ->
					console.log "hola2"


	$('#vote2' ).on 'click', (e) ->
		if $.cookie 'vote'
			console.log ("Ya votaste!")
		else
			$.cookie('vote', 'vote', { expires: 1 })
			$.ajax '/vota/'+$('#battle').data('battle')+'/2',
				type: 'GET'
				dataType: 'html'
				success: (data, status, xhr) ->
					console.log "hola1"
				error: (jqXHR, textStatus, errorThrown) ->
					console.log "hola2"