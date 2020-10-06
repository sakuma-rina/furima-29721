class OrderDestination

  include ActiveModel::Model
  attr_accessor  :post_code,:state_id,:city,:address,:building_name,:phone_number,:user_id,:item_id,:token

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}
    validates :address
    validates :phone_number
   end

  with_options numericality: { other_than: 1 } do
    validates :state_id
  end

  


  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Destination.create(post_code: post_code, state_id: state_id, city: city,address: address, building_name: building_name, phone_number: phone_number,order_id: order.id )
  end

end 