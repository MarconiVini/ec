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
  end

  def show
  end

  def destroy
  end

  def edit
  end

  private
    def set_header
      @header = "Addons de Produtos - #{action_name}"
    end

    def addon_params
      params.require(:addon).permit(:name, :type, :description, :value)
    end
end
