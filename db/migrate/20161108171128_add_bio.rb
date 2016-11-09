class AddBio < ActiveRecord::Migration
  # def self.up
  # 	add_column :users, :bio, :string
  # end

  # def self.down
  # 	remove_column :users, :bio
  # end
	def change
		add_column :users, :bio, :text
		add_column :users, :name, :string
		add_column :users, :type, :string
	end
end