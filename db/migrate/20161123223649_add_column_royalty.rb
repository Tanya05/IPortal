class AddColumnRoyalty < ActiveRecord::Migration
  def change
  	add_column :contracts, :royalty, :float
  end
end
