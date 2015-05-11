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
      post :create, :purchase_order => build(purchase_order)
      expect(assigns(:purchase_order).persisted?).to eq(true)
      expect(response).to render_template(:show)
    end

  end
end
