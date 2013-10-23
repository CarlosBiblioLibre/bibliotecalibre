class AddSmallPictureToPosts < ActiveRecord::Migration
  def self.up
    add_attachment :posts, :small_picture
  end

  def self.down
    remove_attachment :posts, :smal_picture
  end
end
