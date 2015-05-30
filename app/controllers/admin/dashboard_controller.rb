class Admin::DashboardController < Admin::BaseAdminController

  def index

  end

  private
  def set_header
  	@header = "Dashboard"
  end
end


