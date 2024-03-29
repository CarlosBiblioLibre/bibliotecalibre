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
#  kind                       :string(255)
#  bajada                     :text
#  autor                      :text
#

class Post < ActiveRecord::Base
  extend FriendlyId

  attr_accessible :content, :description, :title, :picture, :small_picture, :tag_list, :kind, :bajada, :autor
  acts_as_taggable
  acts_as_votable
  has_many :hearts

  friendly_id :title, use: [:slugged, :history]

  has_attached_file :picture, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>',
    large: '1170x390'
  }

  has_attached_file :small_picture, styles: {
    thumb: '160x111>',
    face: '320x222',
    square: '200x200>',
    medium: '300x300>'
  }

  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :small_picture, :content_type => /\Aimage\/.*\Z/

  def self.byKind kind, n=1
    if n == 1
      Post.where(kind: kind).order('created_at DESC').first
    else
      Post.where(kind: kind).order('created_at DESC').take(n)
    end
  end

end
