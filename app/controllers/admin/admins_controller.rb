class Admin::AdminsController < Admin::BaseAdminController

  def index
    @admins = Admin.all
  end

  
  private
  def set_header
  	@header = "Administradores - #{action_name}"
  end
end
