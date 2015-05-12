class PurchaseOrder < ActiveRecord::Base
  validates_presence_of :purchasers_name, :address, :city, :state
  after_commit :send_purchase_order_to_pusher

  private

  def send_purchase_order_to_pusher
    Pusher['purchase_channel'].trigger('my_event', {
        message: "#{self.purchasers_name}+#{self.city}+#{self.state}"
    })
  end

end
