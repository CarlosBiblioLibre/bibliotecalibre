# == Schema Information
#
# Table name: posts
#
#  id                         :integer          not null, primary key
#  title                      :string(255)
#  content                    :text
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  picture_file_name          :string(255)
#  picture_content_type       :string(255)
#  picture_file_size          :integer
#  picture_updated_at         :datetime
#  small_picture_file_name    :string(255)
#  small_picture_content_type :string(255)
#  small_picture_file_size    :integer
#  small_picture_updated_at   :datetime
#  description                :text
#

class Post < ActiveRecord::Base
  attr_accessible :content, :description, :title, :picture, :small_picture

  has_attached_file :picture, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>',
    large: '1170x390'
  }


  # thumb: '260x180>',
  has_attached_file :small_picture, styles: {
    thumb: '160x111>',
    face: '320x222',
    square: '200x200>',
    medium: '300x300>'
  }
end
