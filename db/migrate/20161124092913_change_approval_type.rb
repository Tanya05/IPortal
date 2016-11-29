class ChangeApprovalType < ActiveRecord::Migration
  def change
    change_column :ips, :approval_status, :integer
  end
end
