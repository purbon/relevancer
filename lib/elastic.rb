require "singleton"
require 'elasticsearch'

class ElasticClient

  attr_reader :client, :config

  include Singleton

  def initialize
    config = {}
    config[:url] = Settings.elasticsearch.url
    @client = Elasticsearch::Client.new url: config[:url], log: false
  end

  def search(options)
    client.search(index: options[:index], body: options[:body])['hits']['hits'].map { |search_hit| Hit.new(search_hit) }
  end
end
