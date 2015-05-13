class PurchaseOrdersController < ApplicationController

  def new
    @purchase_order = PurchaseOrder.new
    purchase_order_all
    @purchase_order_count = PurchaseOrder.all.count
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
    @limit = 20
    @purchase_order_all = PurchaseOrder.order("id DESC").all.limit(@limit)
  end

  def purchase_order_params
    params.require(:purchase_order).permit(:purchasers_name, :address, :city, :state)
  end
end
