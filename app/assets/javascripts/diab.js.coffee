
window.buzones = [{lat: -33.439306, lng: -70.639791},
                  {lat: -33.435398, lng: -70.643447},
                  {lat: -33.442068, lng: -70.645746},
                  {lat: -33.427105, lng: -70.616520},
                  {lat: -33.358088, lng: -70.506496}]

changeLocation = (position) ->
  window.marker.setPosition(new google.maps.LatLng(position.lat, position.lng))
  window.map.setCenter(new google.maps.LatLng(position.lat, position.lng))

$ ->
  $("body").on "click.scroll-adjust", "[href^=\"#\"]", (e) ->
    console.log 'algoo'
    return false if e and e.isDefaultPrevented()

    $nav = $("div.navbar")
    return false if ( $nav.css('position') != "fixed" )

    $(window).one "scroll", ->
      console.log 'algo'
      # scroll the window up by the height of the navbar
      window.scrollBy 0, -$nav.height()
      return

  $("#new_book_diab").on "ajax:send", (xhr) ->
    $("#save_release").text('Enviando...')
    $("#save_release").addClass "disabled"

  $("#new_book_diab").on "ajax:complete", (xhr, status) ->
    $("#save_release").text('Guardar')
    $("#save_release").removeClass "disabled"

  $("#new_message").on "ajax:send", (xhr) ->
    $("#send-participa").text('Enviando...')
    $("#send-participa").addClass "disabled"

  $("#new_message").on "ajax:complete", (xhr, status) ->
    $("#send-participa").text('Guardar')
    $("#send-participa").removeClass "disabled"

  location = new google.maps.LatLng( window.position.lat, window.position.lng )

  window.mapOptions =
    center: window.buzones[0]
    mapTypeId: google.maps.MapTypeId.ROADMAP
    zoom: 15

  if $('#map_canvas_diab').size() > 0
    window.map = new google.maps.Map($('#map_canvas_diab')[0], window.mapOptions)
    window.marker = new google.maps.Marker
      position: window.buzones[0]
      map: window.map

  $('#book_releases_attributes_0_location').on 'change', () ->
    changeLocation(window.buzones[$('#book_releases_attributes_0_location')[0].selectedIndex])


