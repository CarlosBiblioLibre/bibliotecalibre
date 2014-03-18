class CreateStaticImages < ActiveRecord::Migration
 def change
    create_table :static_images do |t|
      t.string :page_image_uid
      t.string :page_image_name
 
      t.timestamps
    end
  end
end
