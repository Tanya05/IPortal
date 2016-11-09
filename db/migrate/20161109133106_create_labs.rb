class CreateLabs < ActiveRecord::Migration
  def change
    create_table :labs do |t|

      t.timestamps null: false
      t.string :name, null: false
      t.text :keywords
      t.text :description
      t.text :members
    end
  end
end
