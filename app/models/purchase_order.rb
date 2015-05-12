class PurchaseOrder < ActiveRecord::Base
  include PusherObj
  validates_presence_of :purchasers_name, :address, :city, :state
  after_commit :send_purchase_order_to_pusher

  def pusher_string
    "#{self.purchasers_name} #{self.city}, #{self.state}"
  end

  private

  def send_purchase_order_to_pusher
    push(pusher_string)
  end

end
