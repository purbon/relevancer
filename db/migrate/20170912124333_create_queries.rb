class CreateQueries < ActiveRecord::Migration[5.0]
  def change
    create_table :queries do |t|
      t.text :json
      t.string :name
      t.string :index
      t.timestamps
    end
  end
end
