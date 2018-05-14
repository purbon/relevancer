require "elastic"

class Admin::SchemaController < ApplicationController

  layout 'admin_app'

  before_action :authenticate_user!

  def index
    @schemas = Schema.all
  end

  def new
    @schema = Schema.new
    @indices = ::ElasticClient.instance.indices
  end

  def edit
    @schema = Schema.find(params[:id])
    @fields = @schema.fields
  end

  def fields
    puts params.inspect

    name  = params['name']
    index = params['index']
    selected_fields = params.to_hash.group_by { |k| k[0].split("_")[0] }["selected"].map { |t| [t[0].gsub("selected_",""), t[1]] }

    puts selected_fields.inspect

    redirect_to :admin_schema_index
  end

  def mapping
    index = params[:index]
    mapping = ::ElasticClient.instance.mapping(index)
    types = mapping[index]["mappings"].keys
    @definitions = mapping[index]["mappings"][types.first]["properties"]
    respond_to do |format|
      format.html {
        render layout: false
      }
      format.json { 
        render json: @definitions
      }
    end
  end
end
