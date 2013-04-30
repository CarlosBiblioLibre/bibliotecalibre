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
    console.log("Tu navegador no soporta Geolocalización.")

$ ->
  $('#book_code').on 'change click keyup focusout', (e) ->
    $('#form_submit').attr('disabled', 'disabled');  
    if $('#book_code').val().length >= 5
      $('#book_info').html "<div class='alert alert-info'>Cargando datos del libro...</div>"
      $.ajax "/books/#{$('#book_code').val()}/ajax",
        type: 'GET'
        dataType: 'html'
        error: (jqXHR, textStatus, errorThrown) ->
          $('#book_info').html "<div class='alert alert-error'>Ups... algo ha fallado, intentalo en otro momento.</div>"
        success: (data, textStatus, jqXHR) ->
          $('#book_info').html data
          $('#form_submit').removeAttr('disabled');

  $('#code').on 'change click keyup focusout', (e) ->
    $('#form_submit').attr('disabled', 'disabled');  
    if $('#code').val().length >= 5
      $('#form_submit').removeAttr('disabled');

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

  $('#new_release').on 'submit', (e) ->
      $('#release_location').val("#{window.marker.getPosition().toString()}")

  $('#new_book').on 'submit', (e) ->
      $('#book_findings_attributes_0_location').val("#{window.marker.getPosition().toString()}")

 
  $('#form_submit').attr('disabled', 'disabled');

