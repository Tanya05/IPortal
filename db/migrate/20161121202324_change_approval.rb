class ChangeApproval < ActiveRecord::Migration
  def change
  	remove_column :ips, :approval_status
  	add_column :ips, :no_of_approvals, :int, :default => 0
  end
end
