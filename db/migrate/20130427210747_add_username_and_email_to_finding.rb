class AddUsernameAndEmailToFinding < ActiveRecord::Migration
  def change
  	add_column :findings, :username, :string
  	add_column :findings, :email, :string
  end
end
