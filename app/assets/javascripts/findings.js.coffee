window.position = lat: -33.443411, lng: -70.647870
# window.position = lat: -33.425334, lng: -70.612376
# window.position = lat: -33.440108, lng: -70.683346
# window.position = lat: -33.441751, lng: -70.644163
# window.position = lat: -33.440596, lng: -70.665913

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

  $('#code').on 'keypress', (e) ->
    if ((e.which && e.which == 13) || (e.keyCode && e.keyCode == 13))
      if $('#code').val().length >= 5
        e.preventDefault()
        $('#new_finding_form').submit()

  $('#new_finding_form').on 'submit', (e) ->
    $('#code').val( $('#code').val().toUpperCase() )

  location = new google.maps.LatLng( window.position.lat, window.position.lng )

  mapOptions =
    center: location
    mapTypeId: google.maps.MapTypeId.ROADMAP
    zoom: 15

  if $('#map_canvas').size() > 0
    window.map = new google.maps.Map($('#map_canvas')[0], mapOptions)

    window.marker = new google.maps.Marker
      position: location
      map: window.map


    infowindow = new google.maps.InfoWindow
      content: "Leerte: El rincón de los tés y los libros.<br /> Miraflores 610 <br /> Teléfono: 2664 8942 <br />  <img src='/assets/leerte.jpg' alt=''>"

    leerte = new google.maps.Marker
      position: new google.maps.LatLng("-33.435461455359345", "-70.64586102962494")
      map: window.map
      icon: "http://maps.google.com/mapfiles/ms/icons/green-dot.png"

    google.maps.event.addListener leerte, 'click', () ->
      window.marker.setPosition(new google.maps.LatLng("-33.435461455359345", "-70.64586102962494"))

    google.maps.event.addListener leerte, 'mouseover', () ->
      infowindow.open(window.map, leerte)

    google.maps.event.addListener leerte, 'mouseout', () ->
      infowindow.close(window.map, leerte)

    google.maps.event.addListener window.map, 'click', (event) ->
      window.marker.setPosition(event.latLng)
      console.log window.marker.getPosition().toString()
      # window.map.setCenter(event.latLng)
    getLocation()

  window.findings_counter = 0
  if $('#findings_map_canvas').size() > 0
    window.findings_map = new google.maps.Map($('#findings_map_canvas')[0], mapOptions)

    for finding in $('#findings_map_canvas').data('findings')
      do (finding) ->
        if (finding != "")
          window.findings_counter = window.findings_counter + 1
          if window.findings_counter < 1233
            new google.maps.Marker
              position: new google.maps.LatLng(finding.split(',')[0].substring(1), finding.split(',')[1].substring(1, finding.split(',')[1].length - 1) )
              map: window.findings_map
              icon: "http://maps.google.com/mapfiles/ms/icons/red.png"
          else
            new google.maps.Marker
              position: new google.maps.LatLng(finding.split(',')[0].substring(1), finding.split(',')[1].substring(1, finding.split(',')[1].length - 1) )
              map: window.findings_map
              icon: "http://maps.google.com/mapfiles/ms/icons/green.png"
        else
          console.log "finding en blanco"

  $('#new_finding').on 'submit', (e) ->
    $('#finding_location').val("#{window.marker.getPosition().toString()}")

  $('#new_release').on 'submit', (e) ->
      $('#release_location').val("#{window.marker.getPosition().toString()}")

  $('#new_book').on 'submit', (e) ->
    if $('#book_findings_attributes_0_location').size() > 0
      $('#book_findings_attributes_0_location').val("#{window.marker.getPosition().toString()}")
    if $('#book_releases_attributes_0_location').size() > 0
      $('#book_releases_attributes_0_location').val("#{window.marker.getPosition().toString()}")



  $('#form_submit').attr('disabled', 'disabled');

  $("input,select,textarea").not("[type=submit]").jqBootstrapValidation
    filter: () ->
      $(this).is(":visible");

  if $('.tinymce').size() > 0
    tinyMCE.init({"selector":"textarea.tinymce","theme_advanced_toolbar_location":"top","theme_advanced_toolbar_align":"left","theme_advanced_statusbar_location":"bottom","theme_advanced_buttons3_add":"tablecontrols,fullscreen","plugins":"table,fullscreen,link,uploadimage"});

  $('#flickr_badge_wrapper').find('a').click () ->
    !window.open(this)
    console.log("click!")

  foundFBComs = false
  $(".fb-comments-unloaded").each ->
    $fbCom = $(this)
    contWidth = $fbCom.parent().width()
    $fbCom.attr("data-width", contWidth).removeClass("fb-comments-unloaded").addClass "fb-comments"
    foundFBComs = true
    return

  FB.XFBML.parse()  if foundFBComs and typeof FB isnt "undefined"