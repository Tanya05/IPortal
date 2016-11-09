class CreateStakeholders < ActiveRecord::Migration
  def change
    create_table :stakeholders do |t|

      t.timestamps null: false
      t.float :percentage, default: 0.0
      t.belongs_to :ip
      t.belongs_to :user
    end
  end
end
