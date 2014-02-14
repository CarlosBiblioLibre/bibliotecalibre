class CreateBattle < ActiveRecord::Migration
  def change
  	create_table :battles do |t|
      t.string :title
      t.string :content

      t.string :book1
      t.string :book2

      t.integer :book1_count
      t.integer :book2_count

      t.timestamps
    end
  end
end
