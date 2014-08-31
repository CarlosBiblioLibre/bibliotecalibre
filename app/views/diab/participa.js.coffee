<% if @bien %>
  $('.msg-participa').html "<div id='alert-participa' class='alert alert-info'>
  <button type='button' class='close' data-dismiss='alert'>&times;</button>
  ¡Tu mensaje a sido enviado! Nos contactaremos contigo a la brevedad.
  </div >"
<% else %>
  $('.msg-participa').html "<div id='alert-participa' class='alert alert-info'>
  <button type='button' class='close' data-dismiss='alert'>&times;</button>
  Debes completar todos los campos para enviar tu mensaje ;)
  </div >"
<% end %>

