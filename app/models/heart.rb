class Heart < ActiveRecord::Base
	attr_accessible :heart, :post_id
	belongs_to :post
	validates :post_id, presence: true
end