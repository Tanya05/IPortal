class AddIiitbFlag < ActiveRecord::Migration
  def change
		add_column :users, :isIIITB, :boolean, :default => false
	end
end
