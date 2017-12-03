require "elastic"

class Admin::SchemaController < ApplicationController

  layout 'admin_app'

  before_action :authenticate_user!

  def index
    @schemas = Schema.all
  end

  def new
    @schema = Schema.new
    j=0
    @indices = ::ElasticClient.instance.indices
  end

  def edit
    @schema = Schema.find(params[:id])
    @fields = @schema.fields
  end
end
