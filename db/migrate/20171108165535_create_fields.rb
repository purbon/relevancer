class CreateFields < ActiveRecord::Migration[5.0]
  def change
    create_table :fields do |t|
      t.belongs_to :schema, index: true
      t.string :name
      t.string :type
      t.boolean :selected
      t.integer :order

      t.timestamps
    end
    add_index :fields, :name, unique: true
  end
end
