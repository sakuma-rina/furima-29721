class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :address
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :day
  belongs_to_active_hash :fee

  belongs_to :user
  has_one_attached :image
  has_one :order

  with_options presence: true do
    validates :product_name, :description, :image
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id, :condition_id, :fee_id, :address_id, :day_id
  end

  with_options numericality: { greater_than: 299, less_than: 10_000_000 } do
    validates :price
  end

end
