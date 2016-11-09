class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|

      t.timestamps null: false
      t.string :type
      t.belongs_to :ip
    end
  end
end
