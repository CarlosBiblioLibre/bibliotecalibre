window.position = lat: -33.440596, lng: -70.665913

changeLocation = (position) ->
  window.marker.setPosition(new google.maps.LatLng(position.coords.latitude, position.coords.longitude))
  window.map.setCenter(new google.maps.LatLng(position.coords.latitude, position.coords.longitude))
  #window.position = lat: position.coords.latitude, lng: position.coords.longitude

errorHandler = (err) ->
  if (err.code == 1)
    console.log("Error: Access is denied!")
  else if( err.code == 2)
    console.log("Error: Position is unavailable!")

getLocation = ->
  if(navigator.geolocation)
    options = { timeout:60000 }
    navigator.geolocation.getCurrentPosition(changeLocation, errorHandler, options)
  else
    console.log("Sorry, browser does not support geolocation!")

$ ->
  location = new google.maps.LatLng( window.position.lat, window.position.lng )

  mapOptions = 
    center: location
    mapTypeId: google.maps.MapTypeId.ROADMAP
    zoom: 15

  window.map = new google.maps.Map($('#map_canvas')[0], mapOptions)

  window.marker = new google.maps.Marker
    position: location
    map: window.map

  getLocation()

  google.maps.event.addListener window.map, 'click', (event) -> 
    window.marker.setPosition(event.latLng)
    #window.map.setCenter(event.latLng)
