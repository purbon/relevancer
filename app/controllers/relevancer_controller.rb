require "erb"

class RelevancerController < ApplicationController
  def index
    @queries = Query.all
  end

  def search
    @queries = Query.all
    @options = [ ['Nothing', -1], ['Perfect', 10], ['Excellent', 7], ['Good', 3], ['Fair', 0.5], ['Bad', 0] ]
    @response = []
    if params.has_key?("query")
      @queryId = params["query"]["id"]
      @query_param = params["q"]
      query   = Query.find(@queryId)
      fields  = query.selected_fields
      options = query_render(query, params)
      result  = Query.run(options)['hits']['hits'].map do |hit|
        doc = { '_id' => hit['_id'], '_doc' => {} }
        fields.each do |field|
          doc['_doc'][field.order] = hit['_source'][field.name]
        end
        @response << doc
      end
    end
    #redirect_back fallback_location: :root
  end

  def report
    pairs = params.keys[4..-4].each_slice(2)
    docs = build_docs_list(pairs, params)
    report = Report.build(docs, params["queryID"], params["queryParam"])
    report.save
    redirect_to :search
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
