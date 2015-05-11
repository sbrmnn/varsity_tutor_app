FactoryGirl.define do
  factory :purchase_order do
    product
    purchasers_name "First Name and Last Name"
    address "30 5th st ne unit 704"
    city "Atlanta"
    state "Ga"
  end

end
