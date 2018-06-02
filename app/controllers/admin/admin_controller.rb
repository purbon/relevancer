class Admin::AdminController < ApplicationController

  layout 'admin_app'

  before_action :verify_admin

  def index
  end

end
