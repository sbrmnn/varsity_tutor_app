class PurchaseOrder < ActiveRecord::Base
  validates_presence_of :purchasers_name, :address, :city, :state
end
