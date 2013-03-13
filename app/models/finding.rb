class Finding < ActiveRecord::Base
  attr_accessible :location, :book_id

  belongs_to :book
end
