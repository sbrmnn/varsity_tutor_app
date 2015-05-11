class PurchaseOrdersController < ApplicationController
  def new
    @purchase_order = PurchaseOrder.new
  end

  def create
    @purchase_order = PurchaseOrder.new(purchase_order_params)
    if @purchase_order.save
      redirect_to @purchase_order
    else
      render :new
    end
  end

  def show
    @purchase_order = PurchaseOrder.find(params[:id])
  end

  private

  def purchase_order_params
    params.require(:purchase_order).permit(:purchasers_name, :address, :city, :state)
  end
end
