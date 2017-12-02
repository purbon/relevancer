require "elastic"
require "json"
require "mustache"

class Query < ApplicationRecord

  has_and_belongs_to_many :schemas

  def run(params, elastic_client=ElasticClient.instance)
    options = render(params)
    body    = JSON.parse(options[:query])
    elastic_client.search(index: options[:index], body: body)
  end

  def selected_fields
    schemas.first.fields.where(selected: true).order(:order)
  end

  def render(params)
    query_param     = params["q"]
    generated_query = Mustache.render(json, query_param: query_param)
    { query:  generated_query, index: index, param: query_param }
  end
end
