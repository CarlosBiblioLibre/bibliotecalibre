window.position = lat: -33.440596, lng: -70.665913

changeLocation = (position) ->
  window.marker.setPosition(new google.maps.LatLng(position.coords.latitude, position.coords.longitude))
  window.map.setCenter(new google.maps.LatLng(position.coords.latitude, position.coords.longitude))

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

  $('#new_finding').on 'submit', (e) ->
    $('#finding_location').val("#{window.marker.getPosition().toString()}")

  $('#form_submit').attr('disabled', 'disabled');

  $('#book_code').on 'keyup', (e) ->
    if $('#book_code').val().length >= 5
      $.ajax "/books/#{$('#book_code').val()}/ajax",
        type: 'GET'
        dataType: 'html'
        error: (jqXHR, textStatus, errorThrown) ->
          $('#book_info').html "Ups... algo ha fallado, intentalo en otro momento."
        success: (data, textStatus, jqXHR) ->
          $('#book_info').html data
          $('#form_submit').removeAttr('disabled');