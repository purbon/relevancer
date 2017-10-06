require "singleton"
require 'elasticsearch'

class ElasticClient

  include Singleton

  attr_reader :client

  def initialize
    @client = Elasticsearch::Client.new log: false
  end
end
