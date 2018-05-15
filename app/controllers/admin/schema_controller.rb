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

  def destroy
    query = Schema.find(params[:id])
    query.destroy
  end

  def fields
    puts params.inspect

    name  = params['name']
    index_name = params['index']
    selected_fields = params.to_hash.group_by { |k| k[0].split("_")[0] }["selected"].map { |t| [t[0].gsub("selected_",""), t[1]] }

    # [["text", "text"], ["text.keyword", "keyword"]]

    schema = Schema.create(name: name)
    i = 1;
    selected_fields.each do |field|
      Field.create(name: field[0], selected:true, order: i, schema: schema)
      i = i + 1
    end

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
