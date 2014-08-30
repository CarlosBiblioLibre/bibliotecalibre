console.log '<%=j @book.title %>'
$('.guardar_diab').toggleClass 'hide'
$('#book_title').val ""
$('#book_author').val ""
$('#book_genre').val 'Arte'
$('.msg_ajax').html "<div class='alert alert-info'>
  <button type='button' class='close' data-dismiss='alert'>&times;</button>
  ¡Muchas gracias por registrar un libro nuevo! Recuerda llevarlo este 21 de septiembre.
  Para agregar otro libro haz clic acá.
  </div >"