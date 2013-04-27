class AddUserAndEmailToRelease < ActiveRecord::Migration
  def change
  	add_column :releases, :username, :string
  	add_column :releases, :email, :string
  end
end
