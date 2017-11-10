require "erb"

class JudgementsController < ApplicationController

  def index
    @judgements = Judgement.group(:queryParam)
                     .group(:queryId)
                     .group(:docID)
                     .select('docID, queryId, queryParam, ROUND(AVG(rel)) as rel')
                     .order(:docID, :queryId)

    respond_to do |format|
      format.html
      format.csv { send_data Judgement.to_csv(@judgements), filename: "judgements-#{Date.today}.csv" }
    end
  end

end
