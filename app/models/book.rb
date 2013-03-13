class Book < ActiveRecord::Base
  attr_accessible :pages, :title

  has_many :findings
end
