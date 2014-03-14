class AddBajadaToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :bajada, :text
  end
end
