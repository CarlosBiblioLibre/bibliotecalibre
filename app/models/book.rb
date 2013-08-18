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
  attr_accessible :pages, :title, :code, :author, :editorial, :genre, :subgenre, :findings_attributes

  has_many :findings, dependent: :destroy
  has_many :releases

  accepts_nested_attributes_for :findings

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
    return [['Autoayuda', 'Autoayuda'],
     ['Biografía', 'Biografía'],
     ['Crónica & Periodismo', 'Crónica & Periodismo'],
     ['Cuento', 'Cuento'],
     ['Ensayo', 'Ensayo'],
     ['Esotérico', 'Esotérico'],
     ['Filosofía & Psicología', 'Filosofía & Psicología'],
     ['Gastronomía', 'Gastronomía'],
     ['Historia', 'Historia'],
     ['Infantil & Juvenil', 'Infantil & Juvenil'],
     ['Novela', 'Novela'],
     ['Poesía', 'Poesía'],
     ['Política', 'Política'],
     ['Religión', 'Religión'],
     ['Teatro', 'Teatro'],
     ['Otro', 'Otro']]
  end
end
