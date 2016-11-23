class TableChanges < ActiveRecord::Migration
  def change
  	remove_column :ips, :owners
  	remove_column :ips, :no_of_approvals
  	add_column :ips, :approval_status, :int, :default => nil
  end
end
