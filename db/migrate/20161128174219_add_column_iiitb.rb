class AddColumnIiitb < ActiveRecord::Migration
  def change
  	add_column :ips, :iiitbStake, :float, :default => '20.0'
  end
end
