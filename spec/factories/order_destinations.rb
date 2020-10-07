FactoryBot.define do
  factory :order_destination do
    token { 'aaa' }
    post_code { '123-4567' }
    state_id  { 2 }
    city { '横浜市' }
    address { '青葉区' }
    building_name { 'アサガオハイツ' }
    phone_number { '08012345678' }
  end
end
