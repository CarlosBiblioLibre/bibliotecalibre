class AddEditorialColumnToBooks < ActiveRecord::Migration
  def change
  	add_column :books, :editorial, :string
  end
end
