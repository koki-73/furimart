class Item < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes
  has_many :item_images, dependent: :destroy
  has_many :user_rates
  belongs_to :user
  belongs_to :category
  belongs_to :size
  belongs_to :brand
  belongs_to :buyer, class_name: "User"
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :item_status
  belongs_to_active_hash :item_delivery_fee
  belongs_to_active_hash :item_delivery_method
  belongs_to_active_hash :item_prefecture
  belongs_to_active_hash :item_preparation_day
end
