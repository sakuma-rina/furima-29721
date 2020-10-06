class Destination < ApplicationRecord
  belongs_to :order

  #   with_options presence: true do
  #     validates :post_code,:state_id,:city,:address,:phone_number,:order_id
  #  end
end
