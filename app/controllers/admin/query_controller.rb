class Admin::QueryController < ApplicationController

  layout 'admin_app'

  before_action :authenticate_user!

  def index
    @queries = Query.all
  end


  def new
    @query = Query.new
  end


  def show
    @query = Query.find(params[:id])
  end

  def edit
    @query = Query.find(params[:id])
  end

  def create
    @query = Query.new(query_params)

    if @query.save
      redirect_to :admin_query_index
    else
      render :action => "new"
    end

  end

  def update
    @query = Query.find(params[:id])
    if @query.update_attributes(query_params)
      flash[:success] = "Query updated"
      redirect_to :action => "index"
    else
      render :action => "edit"
    end

  end

  def destroy
    query = Query.find(params[:id])
    query.destroy
  end

  def query_params
    params.require(:query).permit(:json, :name, :index)
  end

end
