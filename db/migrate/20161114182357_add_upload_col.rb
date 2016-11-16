class AddUploadCol < ActiveRecord::Migration
  def change
  	add_column :ips, :uploads, :string
  end
end
