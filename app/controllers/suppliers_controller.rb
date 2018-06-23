class SuppliersController < ApplicationController
  def new
    @services = Service.all
    @areas = Area.all
    @supplier = Supplier.new
    @availability = Availability.new
    @image = Image.new
  end

  def create
    @supplier = Supplier.new(supplier_params)
    if @supplier.save
      redirect_to suppliers_path
    else
      render :new
    end
  end

  def index
    @suppliers = Supplier.all
  end

  private

  def supplier_params
    params.require(:supplier).permit(:owner, :description, :price, :avg_rating, :originality, :email, :capacity, :address, :service_name, :service_id, :photo)
  end
end
