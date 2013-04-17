class Release < ActiveRecord::Base
  attr_accessible :book_id, :location

  belongs_to :book

  validates_presence_of :book_id
end
