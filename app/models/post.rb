class Post < ActiveRecord::Base
  attr_accessible :content, :description, :title, :picture, :small_picture

  has_attached_file :picture, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>',
    large: '1170x390'
  }

  has_attached_file :small_picture, styles: {
    thumb: '100x100>',
    square: '200x200>',
    medium: '300x300>'
  }
end
