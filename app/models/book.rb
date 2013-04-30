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
  		self.code = 'bb'+SecureRandom.hex(2);
  		self.save
  	end
  end
end
