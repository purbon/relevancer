require "erb"

class RelevancerController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    @queries = Query.all
  end

  def search
    @queries = Query.all
    @options = Ranking.instance.rankings.collect {|p| [ p.name, p.value ] }
    @response = []

    if params.has_key?("query")
      @queryId     = params["query"]["id"]
      @query_param = params["q"]

      query   = Query.find(@queryId)
      @fields  = query.selected_fields

      query.run(params).each do |hit|
        doc = { '_id' => hit.id, '_doc' => {} }
        @fields.each do |field|
          doc['_doc'][field.order] = hit.field(field.name)[0..500]
        end
        @response << doc
      end
    end

    respond_to do |format|
      format.html
      format.json { render :json => @response.to_json  }
    end
  end

  def report
    pairs = params.keys[4..-4].each_slice(2)

    docs = build_docs_list(pairs, params)
    report = Report.build(docs, params["queryID"], params["queryParam"])
    report.save

    judgements = pairs.map do |pair|
      Judgement.create(docID: params[pair[0]], rel: params[pair[1]].to_f, queryId: params["queryID"], queryParam: params["queryParam"])
    end

    list = JudgementList.create
    list.judgements << judgements
    list.save

    redirect_to :root
  end

  private

  def build_docs_list(pairs, params)
    pairs.map do |pair|
      {docID: params[pair[0]], rel: params[pair[1]].to_f}
    end
  end

  def query_render(query_obj, params)
    query_param     = params["q"]
    renderer        = ERB.new(query_obj.json)
    generated_query = renderer.result(binding)
    { query:  generated_query, index: query_obj.index, param: query_param }
  end
end
