class ChangeColumnContract < ActiveRecord::Migration
  def change
  	rename_column :contracts, :type, :Type 
  end
end
