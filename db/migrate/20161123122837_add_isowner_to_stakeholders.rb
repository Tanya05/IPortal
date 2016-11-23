class AddIsownerToStakeholders < ActiveRecord::Migration
  def change
    add_column :stakeholders, :isOwner, :boolean
  end
end
