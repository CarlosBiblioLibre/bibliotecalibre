showLocation = (position) ->
  latitude = position.coords.latitude
  longitude = position.coords.longitude
  alert("Latitude : #{latitude} Longitude: #{longitude}")

errorHandler = (err) ->
  if (err.code == 1)
    alert("Error: Access is denied!")
  else if( err.code == 2)
    alert("Error: Position is unavailable!")

getLocation = ->
  if(navigator.geolocation)
    ## timeout at 60000 milliseconds (60 seconds)
    options = {timeout:60000}
    navigator.geolocation.getCurrentPosition(showLocation, errorHandler, options)
  else
    alert("Sorry, browser does not support geolocation!")

$ ->
	mapOptions =
  	center: new google.maps.LatLng(-34.397, 150.644),
  	zoom: 8,
  	mapTypeId: google.maps.MapTypeId.ROADMAP
  map = new google.maps.Map($('#map_canvas')[0], mapOptions)

