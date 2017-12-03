class Admin::SchemaController < ApplicationController

  layout 'admin_app'

  before_action :authenticate_user!

  def index
  end
end
