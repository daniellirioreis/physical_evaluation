class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy, :generate]

  respond_to :html

  def index
    @sales = Sale.all

    @sales_cash_value = Sale.by_type_sale(TypeSale::IN_CASH).by_done(true).sum(:price)
    @sales_installment_value = Sale.by_type_sale(TypeSale::IN_INSTALLMENT).by_done(true).sum(:price)

    @installments_paid = Installment.paid(true).sum(:price)
    @installments_not_paid = Installment.paid(false).sum(:price)

    @total_sales =  @sales_cash_value + @installments_paid

    respond_with(@sales)
  end

  def show
    respond_with(@sale)
  end

  def new
    @sale = Sale.new
    respond_with(@sale)
  end

  def edit
    @sale.student_name = @sale.student
    @sale.package_name = @sale.package
    
  end

  def create
    @sale = Sale.new(sale_params)
    @sale.save
    respond_with(@sale)
  end

  def update
    @sale.update(sale_params)
    respond_with(@sale)
  end

  def destroy
    @sale.destroy
    respond_with(@sale)
  end

  def generate
    @sale.update_attributes(done: true)
    redirect_to @sale
  end

  private
    def set_sale
      @sale = Sale.find(params[:id])
    end

    def sale_params
      params.require(:sale).permit(:student_id, :package_id, :done, :price, :type_sale, :discount, :installment)
    end
end
