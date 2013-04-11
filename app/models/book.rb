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
  attr_accessible :pages, :title, :code

  has_many :findings

  after_initialize :generate_code

  def generate_code
  	if not self.code
  		#SecureRandom.random_number(99999).to_s.center(5, SecureRandom.random_number(9).to_s)
  		self.code = SecureRandom.hex(3);
  		self.save
  	end
  end
end
