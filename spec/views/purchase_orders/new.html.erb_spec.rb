require 'rails_helper'

RSpec.describe "purchase_orders/new.html.erb", type: :view do
  it 'should purchase order form correctly' do
    assign(:purchase_order, PurchaseOrder.new(purchasers_name: nil, city: nil))
    render
    
    rendered.should have_selector("form" ) do |f|
         f.should have_selector("#purchase_order_purchasers_name")
         f.should have_selector("#purchase_order_address")
         f.should have_selector("#purchase_order_city")
         f.should have_selector("#purchase_order_state")
         f.should have_selector("input", :type => "submit")
      end
  end
end
