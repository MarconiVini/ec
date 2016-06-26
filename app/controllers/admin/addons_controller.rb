class Admin::AddonsController < Admin::BaseAdminController
  def index
    @addons = Addon.page(params[:page])
  end

  def new
    @addon = Addon.new
  end

  def create
    @addon = Addon.new(addon_params)
    if @addon.save
      flash[:notice] = "O Addon \"#{@addon.name}\" foi criado com sucesso !"
      redirect_to action: :index
    else
      render :new
    end
  end

  def update
    @addon = Addon.find(params[:id])
    paramters = addon_params
    if @addon.update_attributes paramters
      flash[:notice] = "O Addon \"#{@addon.name}\" foi editado com sucesso !"
      redirect_to admin_addons_path
    else
      render :action => :edit
    end
  end

  def show
    @addon = Addon.find(params[:id])
  end

  def destroy
    addon = Addon.find(params[:id])
    addon.delete
    redirect_to admin_addons_path
  end

  def edit
    @addon = Addon.find(params[:id])
  end

  private
    def set_header
      @header = "Addons de Produtos - #{action_name}"
    end

    def addon_params
      params.require(:addon).permit(:name, :type, :description, :value)
    end
end
