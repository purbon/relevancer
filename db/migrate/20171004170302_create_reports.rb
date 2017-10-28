class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.integer :queryId
      t.string :queryParam
      t.decimal :dcg
      t.decimal :ndcg
      t.decimal :idcg
      t.timestamps
    end
  end
end
