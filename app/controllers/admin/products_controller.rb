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

  def update
    product = Product.find(params[:product_id])
    if product.update_attributes product_params
      flash[:notice] = "O Produto \"#{product.name}\" foi editado com sucesso !"
      redirect_to admin_products_path
    else
      render :action => :edit
    end
  end

  def show
    @product = Product.find(params[:product_id])
  end

  def destroy
    product = Product.find(params[:product_id])
    product.destroy
    redirect_to admin_products_path
  end

  def edit
    @product = Product.find(params[:product_id])
  end

  private
  def set_header
    @header = "Administradores - #{action_name}"
  end

  def product_params
    params.require(:product).permit(:name)
  end
end
