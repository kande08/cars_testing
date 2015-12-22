class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :name
      t.float :price
      t.string :manufacturer
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
