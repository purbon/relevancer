require 'test_helper'

class ReportTest < ActiveSupport::TestCase

  test "should build reports with an ndcg value bigger than zero if dcg is bigger than zero" do
    docs = [ { docID: 1, rel: 1 },
             { docID: 2, rel: 4 },
             { docID: 3, rel: 2 } ]

    report = Report.build(docs, "1", "my Query Params")
    assert report.ndcg > 0
  end

   test "should build reports with an ndcg value bigger than zero" do
    report = Report.new(queryId: 1, queryParam: "foo bar", dcg: 4, idcg: 5, ndcg: 1.88888)
    assert report.ndcg > 0
  end

end
