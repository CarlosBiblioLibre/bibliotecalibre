class AddbookIdColumnToFindings < ActiveRecord::Migration
	def change
      add_column :findings, :book_id, :integer
    end
end
