class Admin::AdminsController < Admin::BaseAdminController

  def index
  end

  
  private
  def set_header
  	@header = "Administradores"
  end
end
