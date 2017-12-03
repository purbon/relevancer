class RemoveReportlines < ActiveRecord::Migration[5.0]
  def change
    drop_table :reportlines_reports
    drop_table :reportlines
  end
end
