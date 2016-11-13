class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :ips, :type, :Type 
  	#Specifying name of the column is Type, not type because type is a keyword 
  end
end
