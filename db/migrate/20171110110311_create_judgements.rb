class CreateJudgements < ActiveRecord::Migration[5.0]
  def change
    create_table :judgements do |t|
      t.string :docID
      t.float :rel
      t.string :queryParam
      t.integer :queryId

      t.timestamps
    end
  end
end
