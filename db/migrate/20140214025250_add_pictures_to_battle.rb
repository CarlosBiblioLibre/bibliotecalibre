class AddPicturesToBattle < ActiveRecord::Migration
  def self.up
    add_attachment :battles, :picture
    add_attachment :battles, :book1_picture
    add_attachment :battles, :book2_picture
  end

  def self.down
    remove_attachment :battles, :picture
    remove_attachment :battles, :book1_picture
    remove_attachment :battles, :book2_picture
  end
end