require "elastic"
require "json"
class Query < ApplicationRecord

  def self.run(query)
    client = ElasticClient.instance.client
    body = JSON.parse(query.json)
    client.search index: query.index, body: body
  end
end
