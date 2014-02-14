# encoding: utf-8
# == Schema Information
#
# Table name: findings
#
#  id         :integer          not null, primary key
#  location   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :integer
#  how        :string(255)
#  username   :string(255)
#  email      :string(255)
#

class Finding < ActiveRecord::Base
  attr_accessible :location, :book_id, :how, :username, :email

  belongs_to :book

  #validates_presence_of :book_id

  def self.how_options
  	# [['Me lo pasaron', 'Me lo pasaron'], ['Lo encontré', 'Lo encontré']]
  	return [['En una liberación', 'En una liberación'], ['Me lo pasó un amigo', 'Me lo pasó un amigo']]
  end

end
