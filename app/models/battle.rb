# == Schema Information
#
# Table name: battles
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  content     :string(255)
#  book1       :string(255)
#  book2       :string(255)
#  book1_count :integer
#  book2_count :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Battle < ActiveRecord::Base

  attr_accessible :title, :content, :book1, :book2, :book1_count, :book2_count, :picture, :book1_picture, :book2_picture

   has_attached_file :picture, styles: {
    large: '1170x390'
  }

   has_attached_file :book1_picture, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

   has_attached_file :book2_picture, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

end
