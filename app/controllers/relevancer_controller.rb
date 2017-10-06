class RelevancerController < ApplicationController
  def index
    @queries = Query.all
  end

  def search
    @queries = Query.all
    @queryId = params["query"]["id"]
    query = Query.find(@queryId)
    @response = Query.run(query)
    #redirect_back fallback_location: :root
  end

  r.

  def report
    #puts params.keys.inspect
    pairs = params.keys[3..-4].each_slice(2)
    report = Report.new(queryId: params["queryID"])
    pairs.each do |pair|
      report.reportlines << Reportline.new(docID: 1, relevancy: 1)
    end
    redirect_to :root
  end
end
