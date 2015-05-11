require 'rails_helper'

RSpec.describe PurchaseOrdersController, type: :controller do
  describe "GET index" do
    it "assigns @purchase_order" do
      get :new
      expect(assigns(:purchase_order).persisted?).to eq(false)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST create" do
    it "should create purchase order" do
      post :create, purchase_order: attributes_for(:purchase_order)
      purchase_order_instance = assigns(:purchase_order)
      expect(purchase_order_instance.persisted?).to eq(true)
      expect(response).to redirect_to(purchase_order_instance)
    end

    it "shouldn't create purchase order with all incomplete fields" do
      post :create, purchase_order: {purchasers_name: nil, address: nil, city: nil, state: nil }
      expect(assigns(:purchase_order).persisted?).to eq(false)
      expect(response).to render_template(:new)
    end

    it "shouldn't create purchase order with all incomplete fields" do
      post :create, purchase_order: {purchasers_name: nil, address: nil, city: nil, state: nil }
      expect(assigns(:purchase_order).persisted?).to eq(false)
      expect(response).to render_template(:new)
    end

    it "shouldn't create purchase order with incomplete purchasers_name field" do
      post :create, purchase_order: {purchasers_name: nil, address: "30 5th st", city: "Atlanta", state: "Ga" }
      expect(assigns(:purchase_order).persisted?).to eq(false)
      expect(response).to render_template(:new)
    end

    it "shouldn't create purchase order with incomplete address field" do
      post :create, purchase_order: {purchasers_name: "Arun Subramanian", address: nil, city: "Atlanta", state: "Ga" }
      expect(assigns(:purchase_order).persisted?).to eq(false)
      expect(response).to render_template(:new)
    end

    it "shouldn't create purchase order with incomplete city field" do
      post :create, purchase_order: {purchasers_name: "Arun Subramanian", address: "30 5th st", city: nil, state: "Ga" }
      expect(assigns(:purchase_order).persisted?).to eq(false)
      expect(response).to render_template(:new)
    end

    it "shouldn't create purchase order with incomplete state field" do
      post :create, purchase_order: {purchasers_name: "Arun Subramanian", address: "30 5th st", city: "Atlanta", state: nil }
      expect(assigns(:purchase_order).persisted?).to eq(false)
      expect(response).to render_template(:new)
    end
  end

  describe "GET show" do
    it "should show @purchase_order" do
      purchase_order = create(:purchase_order)
      get :show, id: purchase_order.id
      assigns(:purchase_order).should eq(purchase_order)
    end
  end
end
