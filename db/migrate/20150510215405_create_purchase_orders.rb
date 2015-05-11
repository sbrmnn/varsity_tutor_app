class CreatePurchaseOrders < ActiveRecord::Migration
  def change
    create_table :purchase_orders do |t|
      t.belongs_to :product, null: false
      t.string :purchasers_name, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false

      t.timestamps null: false
    end
    add_index(:purchase_orders, :product_id)
    add_index(:purchase_orders, :purchasers_name)
    add_index(:purchase_orders, [:address, :city, :state])
  end
end
