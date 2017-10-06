class CreateReportlines < ActiveRecord::Migration[5.0]
  def change
    create_table :reportlines do |t|
      t.string :docID
      t.integer :relevancy

      t.timestamps
    end

    create_table :reportlines_reports, id: false do |t|
      t.belongs_to :report, index: true
      t.belongs_to :reportline, index: true
    end
  end
end
