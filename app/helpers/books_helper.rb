# encoding: utf-8

module BooksHelper
	def genre_to_img(genre)
    return '/assets/genres/' + case genre
      when 'Arte' then 'arte.png'
      when 'Autoayuda' then 'autoayuda.png'
      when 'Biografía' then 'Biografía.png'
      when 'Crónica & Periodismo' then 'crónica_y_periodismo.png'
      when 'Economía & Empresa' then 'economía_y_empresa.png'
      when 'Cuento' then 'novelas_y_cuentos.png'
      when 'Ensayo' then 'ensayo.png'
      when 'Esotérico' then 'esotérico2.png'
      when 'Filosofía & Psicología' then 'filosofía2.png'
      when 'Gastronomía' then 'gastronomía.png'
      when 'Historia' then 'historia2.png'
      when 'Infantil & Juvenil' then 'infantil_y_juvenil.png'
      when 'Novela' then 'novelas_y_cuentos.png'
      when 'Poesía' then 'poesía.png'
      when 'Política' then 'política.png'
      when 'Religión' then 'religión.png'
      when 'Salud' then 'salud.png'
      when 'Teatro' then 'teatro.png'
      when 'Viajes' then 'viajes.png'
      else 'otros.png'
    end
  end
  # return "/assets/libros.jpg"
end
	# return case genre
	# when 'Autoayuda' then 'Autoayuda.png'
      # when 'Biografía' then 'Biografía.png'
      # when 'Crónica & Periodismo' then 'Crónica & Periodismo.png'
      # when 'Cuento' then 'Cuento.png'
      # when 'Ensayo' then 'Ensayo.png'
      # when 'Esotérico' then 'Esotérico.png'
      # when 'Filosofía & Psicología' then 'Filosofía & Psicología.png'
      # when 'Gastronomía' then 'Gastronomía.png'
      # when 'Historia' then 'Historia.png'
      # when 'Infantil & Juvenil' then 'Infantil & Juvenil.png'
      # when 'Novela' then 'Novela.png'
      # when 'Poesía' then 'Poesía.png'
      # when 'Política' then 'Política.png'
      # when 'Religión' then 'Religión.png'
      # when 'Teatro' then 'Teatro.png'
      # when 'Otro' then 'Otro.png'
      # end