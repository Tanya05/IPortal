class CreateTempCommittees < ActiveRecord::Migration
  def change
    create_table :temp_committees do |t|

      t.timestamps null: false
      t.belongs_to :ip
      t.belongs_to :user
    end
  end
end
