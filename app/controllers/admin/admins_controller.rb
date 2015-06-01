class Admin::AdminsController < Admin::BaseAdminController

  def index
    @admins = Admin.page(params[:page])
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new admin_params
    if @admin.save
      flash[:notice] = "O Admin \"#{@admin.name}\" foi criado com sucesso !"
      redirect_to action: :index
    else
      render :new
    end
  end
  
  private
  def set_header
  	@header = "Administradores - #{action_name}"
  end

  def admin_params
    params.require(:admin).permit(:name, :email, :password, :password_confirmation)
  end
end
