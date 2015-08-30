class Admin::ProductsController < Admin::BaseAdminController
  def index
    @products = Product.page(params[:page])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(name: product_params[:name])
    @product = issue_images_to_model(product_params["files"], @product)
    if @product.save
      flash[:notice] = "O Produto \"#{@product.name}\" foi criado com sucesso !"
      redirect_to action: :index
    else
      render :new
    end
  end

  def update
    @product = Product.find(params[:id])
    paramters = product_params
    @product = issue_images_to_model(paramters.delete("files"), @product)
    if @product.update_attributes paramters
      flash[:notice] = "O Produto \"#{@product.name}\" foi editado com sucesso !"
      redirect_to admin_products_path
    else
      render :action => :edit
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def destroy
    product = Product.find(params[:id])
    product.delete
    redirect_to admin_products_path
  end

  def edit
    @product = Product.find(params[:id])
  end

  private
  def set_header
    @header = "Administradores - #{action_name}"
  end

  def issue_images_to_model(product_files, product)
    if !product_files.blank?
      product_files.each do |file|
        product.images << Image.new(file: file)    
      end
    end
    product
  end

  def product_params
    params.require(:product).permit(:name, files: [])
  end
end
