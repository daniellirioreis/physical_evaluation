class PackagesController < ApplicationController
  before_action :set_package, only: [:show, :edit, :update, :destroy]

  respond_to :html

  autocomplete :package, :name, :display_value => :name, :extra_data => [:name] do |items|
    respond_to do |format|
     format.json { render :json => @items }
    end
  end

  def index
    @packages = Package.all
    respond_with(@packages)
  end

  def show
    respond_with(@package)
  end

  def new
    @package = Package.new
    respond_with(@package)
  end

  def edit
  end

  def create
    @package = Package.new(package_params)
    @package.save
    respond_with(@package)
  end

  def update
    @package.update(package_params)
    respond_with(@package)
  end

  def destroy
    @package.destroy
    respond_with(@package)
  end

  private
    def set_package
      @package = Package.find(params[:id])
    end

    def package_params
      params.require(:package).permit(:name, :description, item_packages_attributes: [:id, :product_id, :price, :_destroy])
    end
end
