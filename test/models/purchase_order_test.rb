require File.expand_path("../../test_helper", __FILE__)

describe PurchaseOrder do
  let(:purchase_order_new) { PurchaseOrder.new }
  let(:purchase_order_create) { FactoryGirl.create(:purchase_order) }

  it "should be valid" do
    purchase_order_create
    assert(purchase_order_create.valid?)
  end

  it "must not be valid if none of the fields are filled in" do
    assert(!purchase_order_new.valid?)
  end

  it "must not be valid if address field is not filled in" do
    purchase_order_new.purchasers_name = "Arun"
    purchase_order_new.city = "Atlanta"
    purchase_order_new.state = "Ga"
    assert(!purchase_order_new.valid?)
    assert(purchase_order_new.errors.messages[:address].present?)
  end

  it "must not be valid if purchasers name field is not filled in" do
    purchase_order_new.address = "8777 laurel drive"
    purchase_order_new.city = "Atlanta"
    purchase_order_new.state = "Ga"
    assert(!purchase_order_new.valid?)
    assert(purchase_order_new.errors.messages[:purchasers_name].present?)
  end

  it "must not be valid if city field is not filled in" do
    purchase_order_new.purchasers_name = "Arun"
    purchase_order_new.address = "8777 laurel drive"
    purchase_order_new.state = "Ga"
    assert(!purchase_order_new.valid?)
    assert(purchase_order_new.errors.messages[:city].present?)
  end

  it "should create a pusher string" do
    purchase_order_create
    assert_equal("First Name and Last Name Atlanta, Ga", purchase_order_create.pusher_string)
  end

  it "must not be valid if state field is not filled in" do
    purchase_order_new.purchasers_name = "Arun"
    purchase_order_new.address = "8777 laurel drive"
    purchase_order_new.city = "Atlanta"
    assert(!purchase_order_new.valid?)
    assert(purchase_order_new.errors.messages[:state].present?)
  end

end
