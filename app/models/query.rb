require "elastic"
require "json"

class Query < ApplicationRecord

  has_and_belongs_to_many :schemas

  def self.run(options)
    #client = ElasticClient.new(url: Settings.elasticsearch.url).client
    client = ElasticClient.instance.client
    body = JSON.parse(options[:query])
    client.search index: options[:index], body: body
  end

  def selected_fields
    schemas.first.fields.where(selected: true).order(:order)
  end
end
