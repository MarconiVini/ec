class Admin::ProductsController < Admin::BaseAdminController
  def index
    @products = Product.page(params[:page])
  end

  def new
    @product = Product.new
  end

  def create
    ###TODO: remover o product_params["files"] do product_params de forma a conseguirmos fazer: Product.new(product_params)
    
    @product = Product.new(name: product_params[:name], base_price_string: product_params[:base_price_string])
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
    params = product_params
    @product = issue_images_to_model(params.delete("files"), @product)
    if @product.update_attributes params
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
    @header = "Produtos - #{action_name}"
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
    params.require(:product).permit(:name, :base_price_string, files: [])
  end
end
