class CreateContractDetails < ActiveRecord::Migration
  def change
    create_table :contract_details do |t|

      t.timestamps null: false
      t.float :percentage
      t.belongs_to :contract
      t.belongs_to :user
    end
  end
end
