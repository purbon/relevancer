class Admin::QueryController < ApplicationController

  def index
    @queries = Query.all
  end


  def new
    @query = Query.new
  end

  def create
    @query = Query.new(query_params)

    if @query.save
      redirect_to :admin_query_index
    else
      render :action => "new"
    end

  end

  def query_params
    params.require(:query).permit(:json, :name)
  end

end
