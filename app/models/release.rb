# == Schema Information
#
# Table name: releases
#
#  id         :integer          not null, primary key
#  location   :string(255)
#  book_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string(255)
#  email      :string(255)
#

class Release < ActiveRecord::Base
  attr_accessible :book_id, :location, :username, :email

  belongs_to :book

  # validates_presence_of :book_id, :location, :username, :email
end
