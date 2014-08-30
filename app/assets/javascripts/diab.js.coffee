
window.buzones = [{lat: -33.425334, lng: -70.612376},
                  {lat: -33.440108, lng: -70.683346},
                  {lat: -33.441751, lng: -70.644163},
                  {lat: -33.440596, lng: -70.665913}]

$("body").on "click.scroll-adjust", "[href^=\"#\"]", (e) ->
  return false if e and e.isDefaultPrevented()

  $nav = $("div.navbar")
  return false if ( $nav.css('position') != "fixed" )

  $(window).one "scroll", ->
    # scroll the window up by the height of the navbar
    window.scrollBy 0, -$nav.height()
    return


changeLocation = (position) ->
  window.marker.setPosition(new google.maps.LatLng(position.lat, position.lng))
  window.map.setCenter(new google.maps.LatLng(position.lat, position.lng))

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
    center: window.buzones[0]
    mapTypeId: google.maps.MapTypeId.ROADMAP
    zoom: 15

  if $('#map_canvas_diab').size() > 0
    window.map = new google.maps.Map($('#map_canvas_diab')[0], window.mapOptions)
    window.marker = new google.maps.Marker
      position: window.buzones[0]
      map: window.map

  $('#book_releases_attributes_0_location').on 'change', () ->
    console.log 'asd'
    console.log $('#book_releases_attributes_0_location')[0].selectedIndex
    changeLocation(window.buzones[$('#book_releases_attributes_0_location')[0].selectedIndex])
    console.log window.marker.position


