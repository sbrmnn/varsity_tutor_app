class PurchaseOrdersController < ApplicationController
  def new
    @purchase_order = PurchaseOrder.new
    purchase_order_all
  end

  def create
    @purchase_order = PurchaseOrder.new(purchase_order_params)
    if @purchase_order.save
      redirect_to :root
    else
      flash[:error] = @purchase_order.errors
      purchase_order_all
      render :new
    end
  end

  private

  def purchase_order_all
    @purchase_order_all = []
    PurchaseOrder.find_each do |po|
      @purchase_order_all.unshift(po)
    end
    @purchase_order_all.flatten!
  end

  def purchase_order_params
    params.require(:purchase_order).permit(:purchasers_name, :address, :city, :state)
  end
end
