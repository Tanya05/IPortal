class AddNameToStakeholders < ActiveRecord::Migration
  def change
    add_column :stakeholders, :name, :string
  end
end
