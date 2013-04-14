class AddSubgenreColumnToBooks < ActiveRecord::Migration
  def change
  	add_column :books, :subgenre, :string
  end
end
