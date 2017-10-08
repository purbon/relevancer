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
end
