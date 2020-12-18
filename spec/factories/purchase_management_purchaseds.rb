FactoryBot.define do
  factory :purchase_management_purchased do
    postal_code {"123-4567"}
    address_id {2}
    municipalities {"横浜市緑区"}
    shipping_address {"青山1-1-1"}
    building {"青山11-1"}
    phone_number {"09012345678"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end