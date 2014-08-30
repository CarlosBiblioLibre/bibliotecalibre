window.position = lat: -33.443411, lng: -70.647870

$("body").on "click.scroll-adjust", "[href^=\"#\"]", (e) ->
  return false if e and e.isDefaultPrevented()

  $nav = $("div.navbar")
  return false if ( $nav.css('position') != "fixed" )

  $(window).one "scroll", ->
    # scroll the window up by the height of the navbar
    window.scrollBy 0, -$nav.height()
    return

$ ->
  $("#new_book_diab").on "ajax:send", (xhr) ->
    $("#save_release").text('Enviando...')
    $("#save_release").addClass "disabled"

  $("#new_book_diab").on "ajax:complete", (xhr, status) ->
    $("#save_release").text('Guardar')
    $("#save_release").removeClass "disabled"

  $(".msg_ajax").click ->
    $(".msg_ajax").alert('close')
    $('.guardar_diab').toggleClass 'hide'

  $('.msg_ajax').bind 'closed', () ->
    $('.guardar_diab').toggleClass 'hide'

  location = new google.maps.LatLng( window.position.lat, window.position.lng )

  window.mapOptions =
    center: location
    mapTypeId: google.maps.MapTypeId.ROADMAP
    zoom: 15

  if $('#map_canvas_diab').size() > 0
    console.log 'mapaaa'
    console.log mapOptions
    window.map = new google.maps.Map($('#map_canvas_diab')[0], window.mapOptions)
    window.marker = new google.maps.Marker
      position: location
      map: window.map