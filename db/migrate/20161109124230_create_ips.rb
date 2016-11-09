class CreateIps < ActiveRecord::Migration
  def change
    create_table :ips do |t|

      t.timestamps null: false
      t.string :title, null: false, default: ""
      t.text :description
      t.text :owners
      t.text :type, null: false
      t.boolean :approval_status
    end
  end
end
