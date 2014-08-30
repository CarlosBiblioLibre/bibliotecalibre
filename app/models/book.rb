# encoding: utf-8

# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  pages      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  code       :string(255)
#  author     :string(255)
#  editorial  :string(255)
#  genre      :string(255)
#  subgenre   :string(255)
#

class Book < ActiveRecord::Base
  attr_accessible :pages, :title, :code, :author, :editorial, :genre, :subgenre, :findings_attributes, :releases_attributes

  has_many :findings, dependent: :destroy
  has_many :releases, dependent: :destroy

  accepts_nested_attributes_for :findings, :releases

  #after_initialize :generate_code

  def generate_code
    #TODO: un while o algo asi por aca
  	if not self.code
  		#SecureRandom.random_number(99999).to_s.center(5, SecureRandom.random_number(9).to_s)
  		self.code = 'BB'+SecureRandom.hex(2);
  		self.save
  	end
  end

  def self.generate_code
    code = 'BB' + SecureRandom.hex(2)
    while Book.find_by_code code
      code = 'BB' + SecureRandom.hex(2)
    end
    return code.upcase
  end

  def self.genre
    return [['Arte', 'Arte'],
            ['Autoayuda', 'Autoayuda'],
            ['Biografía', 'Biografía'],
            ['Crónica & Periodismo', 'Crónica & Periodismo'],
            ['Economía & Empresa', 'Economía & Empresa'],
            ['Cuento', 'Cuento'],
            ['Ensayo', 'Ensayo'],
            ['Esotérico', 'Esotérico'],
            ['Filosofía & Psicología', 'Filosofía & Psicología'],
            ['Gastronomía', 'Gastronomía'],
            ['Historia', 'Historia'],
            ['Infantil & Juvenil' , 'Infantil & Juvenil' ],
            ['Novela', 'Novela'],
            ['Poesía', 'Poesía'],
            ['Política', 'Política'],
            ['Religión', 'Religión'],
            ['Salud', 'Salud'],
            ['Teatro', 'Teatro'],
            ['Viajes', 'Viajes'],
            ['Otro', 'Otro']]
  end


  #  "(-33.425334, -70.612376)"
  #  "(-33.440108, -70.683346)"
  #  "(-33.441751, -70.644163)"
  #  "(-33.440596, -70.665913)"

  def self.buzones
    return [['GAM', "(-33.439306, -70.639791)"],
            ['Museo Bellas Artes', "(-33.435398, -70.643447)"],
            ['Biblioteca Nacional de Chile', "(-33.442068, -70.645746)"],
            ['Biblioteca Municipal de Providencia', "(-33.427105, -70.61652)0"],
            ['Centro Lector Lo Barnechea', "(-33.358088, -70.506496)"]]
  end

end

#    [['Autoayuda', 'Autoayuda'],
#     ['Biografía', 'Biografía'],
#     ['Crónica & Periodismo', 'Crónica & Periodismo'],
#     ['Cuento', 'Cuento'],
#     ['Ensayo', 'Ensayo'],
#     ['Esotérico', 'Esotérico'],
#     ['Filosofía & Psicología', 'Filosofía & Psicología'],
#     ['Gastronomía', 'Gastronomía'],
#     ['Historia', 'Historia'],
#     ['Infantil & Juvenil', 'Infantil & Juvenil'],
#     ['Novela', 'Novela'],
#     ['Poesía', 'Poesía'],
#     ['Política', 'Política'],
#     ['Religión', 'Religión'],
#     ['Teatro', 'Teatro'],
#     ['Otro', 'Otro']]


# [['Autoayuda', 'Autoayuda'],
# ['Biografía', 'Biografía'],
# ['Crónica & Periodismo', 'Crónica & Periodismo'],
# ['Economía & Empresa', 'Economía & Empresa'],
# ['Ensayo', 'Ensayo'],
# ['Esotérico', 'Esotérico'],
# ['Filosofía & Psicología', 'Filosofía & Psicología'],
# ['Gastronomía', 'Gastronomía'],
# ['Historia', 'Historia'],
# ['Humor & Comics', 'Humor & Comics'],
# ['Infantil & Juvenil', 'Infantil & Juvenil'],
# ['Narrativa', 'Narrativa'],
# ['Poesía', 'Poesía'],
# ['Política', 'Política'],
# ['Religión', 'Religión'],
# ['Teatro', 'Teatro'],
# ['Otro', 'Otro']]