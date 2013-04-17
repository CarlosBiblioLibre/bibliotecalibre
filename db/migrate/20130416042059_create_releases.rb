class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.string :location
      t.integer :book_id

      t.timestamps
    end
  end
end
