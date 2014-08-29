$("body").on "click.scroll-adjust", "[href^=\"#\"]", (e) ->
  return false if e and e.isDefaultPrevented()

  $nav = $("div.navbar")
  return false if ( $nav.css('position') != "fixed" )

  $(window).one "scroll", ->
    # scroll the window up by the height of the navbar
    window.scrollBy 0, -$nav.height()
    return
