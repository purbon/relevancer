class CreateSchemas < ActiveRecord::Migration[5.0]
  def change
    create_table :queries_schemas, id: false do |t|
      t.belongs_to :query, index: true
      t.belongs_to :schema, index: true
    end

    create_table :schemas do |t|
      t.string :name
      t.string :index

      t.timestamps
    end
    add_index :schemas, :name, unique: true
  end
end
