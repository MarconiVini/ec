class Admin::ProductsController < Admin::BaseAdminController
  def index
    @products = Product.page(params[:page])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:notice] = "O Produto \"#{@product.name}\" foi criado com sucesso !"
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

  def product_params
    params.require(:product).permit(:name)
  end
end
