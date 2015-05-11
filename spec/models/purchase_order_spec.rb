require 'rails_helper'

RSpec.describe PurchaseOrder, type: :model do
  describe "validation tests" do
    it "should not be a valid record if purchasers name is missing" do
       purchase_order = build(:purchase_order, purchasers_name: nil)
       expect(purchase_order.valid?).to eq(false)
    end

    it "should not be a valid record if address is missing" do
       purchase_order = build(:purchase_order, address: nil)
       expect(purchase_order.valid?).to eq(false)
    end

    it "should not be a valid record if city name is missing" do
       purchase_order = build(:purchase_order, city: nil)
       expect(purchase_order.valid?).to eq(false)
    end

    it "should not be a valid record if state is missing" do
       purchase_order = build(:purchase_order, state: nil)
       expect(purchase_order.valid?).to eq(false)
    end
  end
end
