class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.integer :queryId
      t.string :queryParam
      t.timestamps
    end
  end
end
