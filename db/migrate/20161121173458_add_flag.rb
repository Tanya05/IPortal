class AddFlag < ActiveRecord::Migration
  def change
  	remove_column :users, :isAdmin
  	add_column :users, :flag, :int, :default => nil
  end
end
