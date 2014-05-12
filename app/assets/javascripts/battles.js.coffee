$ ->
	if $.cookie 'vote'
			$('#vote1' ).attr('disabled', true)
			$('#vote2' ).attr('disabled', true)

	$('#vote1' ).on 'click', (e) ->
		e.preventDefault()
		if $.cookie 'vote'
			$('#vote1' ).attr('disabled', true)
			$('#vote2' ).attr('disabled', true)
			console.log ("Ya votaste!")
		else
			$.cookie('vote', 'vote', { expires: 1 })
			$.ajax '/vota/'+$('#battle').data('battle')+'/1',
				type: 'GET'
				dataType: 'html'
				success: (data, status, xhr) ->
					y = $('#chart_data').data('book1c') + 1
					$('#book1_count' ).text(y)
					$("#battle_chart").highcharts().series[1].data[0].update(y)
					$('#vote1' ).attr('disabled', true)
					$('#vote2' ).attr('disabled', true)
					console.log "hola1a"
				error: (jqXHR, textStatus, errorThrown) ->
					console.log "hola2"


	$('#vote2' ).on 'click', (e) ->
		e.preventDefault()
		if $.cookie 'vote'
			$('#vote1' ).attr('disabled', true)
			$('#vote2' ).attr('disabled', true)
			console.log ("Ya votaste!")
		else
			$.cookie('vote', 'vote', { expires: 1 })
			$.ajax '/vota/'+$('#battle').data('battle')+'/2',
				type: 'GET'
				dataType: 'html'
				success: (data, status, xhr) ->
					y = $('#chart_data').data('book2c') + 1
					$('#book2_count' ).text(y)
					$("#battle_chart").highcharts().series[0].data[0].update(y)
					$('#vote1' ).attr('disabled', true)
					$('#vote2' ).attr('disabled', true)
					console.log "hola1"
				error: (jqXHR, textStatus, errorThrown) ->
					console.log "hola2"

	if $('#battle_chart').size() > 0
		$("#battle_chart").highcharts
	    chart:
	      type: "bar"
	    credits:
	      enabled: false
	    title:
	      text: ""
	    xAxis:
	      categories: [""]
	      labels:
	        enabled: false
	    yAxis:
	      min: 0
	      title:
	        text: ""
	      labels:
	        enabled: false
	    tooltip:
	      enabled: false
	    plotOptions:
	      series:
	        stacking: "percent"
	      bar:
	        pointWidth: 80
	    series: [
	    	{
	        name: $('#chart_data').data('book2n')
	        data: [$('#chart_data').data('book2c')]
	      }
	      {
	        name: $('#chart_data').data('book1n')
	        data: [$('#chart_data').data('book1c')]
	      }
	    ]

  return