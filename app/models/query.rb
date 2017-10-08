require "elastic"
require "json"

class Query < ApplicationRecord

  def self.run(options)
    #client = ElasticClient.new(url: Settings.elasticsearch.url).client
    client = ElasticClient.instance.client
    body = JSON.parse(options[:query])
    client.search index: options[:index], body: body
  end
end
