# == Schema Information
#
# Table name: battles
#
#  id                         :integer          not null, primary key
#  title                      :string(255)
#  content                    :text
#  book1                      :string(255)
#  book2                      :string(255)
#  book1_count                :integer
#  book2_count                :integer
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  picture_file_name          :string(255)
#  picture_content_type       :string(255)
#  picture_file_size          :integer
#  picture_updated_at         :datetime
#  book1_picture_file_name    :string(255)
#  book1_picture_content_type :string(255)
#  book1_picture_file_size    :integer
#  book1_picture_updated_at   :datetime
#  book2_picture_file_name    :string(255)
#  book2_picture_content_type :string(255)
#  book2_picture_file_size    :integer
#  book2_picture_updated_at   :datetime
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

  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :book1_picture, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :book2_picture, :content_type => /\Aimage\/.*\Z/

end
