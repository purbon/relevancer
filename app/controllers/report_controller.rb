require "erb"

class ReportController < ApplicationController

  def index

    @reports = Report.group(:queryParam)
                     .group(:queryId)
                     .select('queryId, queryParam, AVG(dcg) as dcg, AVG(idcg) as idcg, AVG(ndcg) as ndcg ')
                     .order(:queryId)
  end

end
