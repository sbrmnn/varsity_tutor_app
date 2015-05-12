namespace :purchase_order do
  desc "Create fake purchase order to simulate the pusher feature."
  task create: :environment do
    po = PurchaseOrder.create(:purchasers_name=>"Arun", :address=>"30 5th st ne unit 704", :city=>"Atlanta", :state=>"Ga")
    puts po.persisted?
  end
end
