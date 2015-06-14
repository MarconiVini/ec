class Admin::ProductsController < Admin::BaseAdminController
  def index
    @products = Products.all
  end

  def new
    @products = Products.new
  end

  def create
    @products = Products.new products_params
    if @products.save
      flash[:notice] = "O Products \"#{@Products.name}\" foi criado com sucesso !"
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
  end

  def destroy
  end

  def edit
  end

  private
  def set_header
    @header = "Administradores - #{action_name}"
  end

  def admin_params
    params.require(:admin).permit(:name, :email, :password, :password_confirmation)
  end
end
