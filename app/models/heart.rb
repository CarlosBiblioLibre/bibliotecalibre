# == Schema Information
#
# Table name: hearts
#
#  id      :integer          not null, primary key
#  post_id :integer
#

class Heart < ActiveRecord::Base
	attr_accessible :heart, :post_id
	belongs_to :post
	validates :post_id, presence: true
end
