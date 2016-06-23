class Admin::AddonsController < Admin::BaseAdminController
  def index
    @addons = Addon.page(params[:page])
  end

  def new
    @addon = Addon.new
  end

  def create
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
end
