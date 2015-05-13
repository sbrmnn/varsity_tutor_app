require File.expand_path("../../test_helper", __FILE__)

class PurchaseOrdersControllerTest < ActionController::TestCase
  def setup
    @purchase_order = create(:purchase_order)
    @purchase_order_all_desc_limit_20 = PurchaseOrder.order("id DESC").all.limit(20)
    @purchase_order_count = PurchaseOrder.all.count

  end
  def test_new_response
    get :new
    assert_response :success
  end
  def test_new_object
    get :new
    assert_equal(false, assigns(:purchase_order).persisted?)
  end
  def test_total_post_count
    get :new
    assert_equal(@purchase_order_count, assigns(:purchase_order_count))
  end
  def test_new_object_purchase_order_all_desc_limit_20
    get :new
    assert_equal(@purchase_order_all_desc_limit_20, assigns(:purchase_order_all))
  end
  def test_create_action
    post :create, purchase_order: attributes_for(:purchase_order)
    assert_equal( true, assigns(:purchase_order).persisted?)
    assert_equal(nil, assigns(:purchase_order_count))
    assert_equal(nil, assigns(:purchase_order_all))
    assert_redirected_to "/"
  end
  def test_create_purchase_order_with_all_incomplete_fields
    post :create, purchase_order: {purchasers_name: nil, address: nil, city: nil, state: nil }
    assert_equal( false, assigns(:purchase_order).persisted?)
    assert_equal(@purchase_order_all_desc_limit_20, assigns(:purchase_order_all))
    assert_equal(@purchase_order_count, assigns(:purchase_order_count))
    assert_template("new")
  end
  def test_create_purchase_order_with_address_incomplete_field
    post :create, purchase_order: {purchasers_name: nil, address: "30 5th st", city: "Atlanta", state: "Ga" }
    assert_equal( false, assigns(:purchase_order).persisted?)
    assert_equal(@purchase_order_all_desc_limit_20, assigns(:purchase_order_all))
    assert_equal(@purchase_order_count, assigns(:purchase_order_count))
    assert_template("new")
  end
  def test_create_purchase_order_with_address_incomplete_field
    post :create, purchase_order: {purchasers_name: "Arun Subramanian", address: nil, city: "Atlanta", state: "Ga" }
    assert_equal( false, assigns(:purchase_order).persisted?)
    assert_equal(@purchase_order_all_desc_limit_20, assigns(:purchase_order_all))
    assert_equal(@purchase_order_count, assigns(:purchase_order_count))
    assert_template("new")
  end
  def test_create_purchase_order_with_city_incomplete_field
    post :create, purchase_order: {purchasers_name: "Arun Subramanian", address: "30 5th st", city: nil, state: "Ga" }
    assert_equal( false, assigns(:purchase_order).persisted?)
    assert_equal(@purchase_order_all_desc_limit_20, assigns(:purchase_order_all))
    assert_equal(@purchase_order_count, assigns(:purchase_order_count))
    assert_template("new")
  end
  def test_create_purchase_order_with_state_incomplete_field
    post :create, purchase_order: {purchasers_name: "Arun Subramanian", address: "30 5th st", city: "Atlanta", state: nil }
    assert_equal( false, assigns(:purchase_order).persisted?)
    assert_equal(@purchase_order_all_desc_limit_20, assigns(:purchase_order_all))
    assert_equal(@purchase_order_count, assigns(:purchase_order_count))
    assert_template("new")
  end
end
