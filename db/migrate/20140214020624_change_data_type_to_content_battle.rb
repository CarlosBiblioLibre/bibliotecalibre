class ChangeDataTypeToContentBattle < ActiveRecord::Migration
  def self.up
    change_table :battles do |t|
      t.change :content, :text
    end
  end
  def self.down
    change_table :battles do |t|
      t.change :content, :string
    end
  end
end
