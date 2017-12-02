require "elastic"
require "json"

class Query < ApplicationRecord

  has_and_belongs_to_many :schemas

  def run(params)
    options = render(params)
    client = ElasticClient.instance.client
    body = JSON.parse(options[:query])
    client.search(index: options[:index], body: body)['hits']['hits'].map { |search_hit| Hit.new(search_hit) }
  end

  def selected_fields
    schemas.first.fields.where(selected: true).order(:order)
  end

  def render(params)
    query_param     = params["q"]
    renderer        = ERB.new(json)
    generated_query = renderer.result(binding)
    { query:  generated_query, index: index, param: query_param }
  end
end
