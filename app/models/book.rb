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
#

class Book < ActiveRecord::Base
  attr_accessible :pages, :title, :code, :author, :editorial, :genre, :subgenre

  has_many :findings

  after_initialize :generate_code

  def generate_code
    #TODO: un while o algo asi por aca
  	if not self.code
  		#SecureRandom.random_number(99999).to_s.center(5, SecureRandom.random_number(9).to_s)
  		self.code = 'bb'+SecureRandom.hex(2);
  		self.save
  	end
  end
end
