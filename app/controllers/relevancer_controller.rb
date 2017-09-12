class RelevancerController < ApplicationController
  def index
    @queries = Query.all
  end
end
