class CreateFindings < ActiveRecord::Migration
  def change
    create_table :findings do |t|
      t.string :location

      t.timestamps
    end
  end
end
