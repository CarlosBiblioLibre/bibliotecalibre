console.log '<%=j @book.title %>'
$('.guardar_diab').toggleClass 'hide'
$('#book_title').val ""
$('#book_author').val ""
$('#book_genre').val 'Arte'
$('.msg_ajax').html "<div id='alert-ajax' class='alert alert-info'>
  <button type='button' class='close' data-dismiss='alert'>&times;</button>
  ¡Muchas gracias por registrar un nuevo libro! Tienes hasta el lunes 15 de septiembre para depositar el libro en el buzón.
  ¡Nos vemos en el Día B! Para agregar otro libro haz clic acá.
  </div >"

$("#alert-ajax").click ->
  $("#alert-ajax").alert('close')
  $('.guardar_diab').removeClass 'hide'
  $('.guardar_diab').addClass 'show'

$('#alert-ajax').bind 'closed', () ->
  $('.guardar_diab').removeClass 'hide'
  $('.guardar_diab').addClass 'show'