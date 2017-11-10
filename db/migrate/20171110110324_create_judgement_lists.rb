class CreateJudgementLists < ActiveRecord::Migration[5.0]
  def change
    create_table :judgement_lists do |t|
      t.timestamps
    end

    create_table :judgement_lists_judgements, id: false do |t|
      t.belongs_to :judgement, index: true
      t.belongs_to :judgement_list, index: true
    end

  end
end
