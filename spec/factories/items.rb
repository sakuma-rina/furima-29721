FactoryBot.define do
  factory :item do
    product_name {Faker::Name.name}
    description {"あああ"}
    category_id   {2}
    condition_id  {2}
    fee_id        {2}
    address_id    {2}
    days_id  {2}
    price {"9999"}

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/camera.png'), filename: 'camera.png')
    end
   
    association :user

  end
end

