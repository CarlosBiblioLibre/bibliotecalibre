class AddHowColumnToFindings < ActiveRecord::Migration
  def change
  	add_column :findings, :how, :string
  end
end
