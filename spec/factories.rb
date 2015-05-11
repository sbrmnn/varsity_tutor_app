FactoryGirl.define do

  factory :product do
    name "wunder-beverage"
    photo_url  "http://library.the-group.net/rexam/client_upload/image/Grolsch_3FM_Serious_Request.jpg"
  end

  factory :purchase_order do
    product
    purchasers_name "First Name and Last Name"
    address "30 5th st ne unit 704"
    city "Atlanta"
    state "Ga"
  end

end
