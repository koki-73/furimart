class Item < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes
  has_many :item_images
  has_many :user_rates
  belongs_to :user
  belongs_to :category
  belongs_to :size, optional: true
  belongs_to :buyer, class_name: "User", optional: true
  accepts_nested_attributes_for :item_images, allow_destroy: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :item_status
  belongs_to_active_hash :item_delivery_fee
  belongs_to_active_hash :item_delivery_method
  belongs_to_active_hash :item_prefecture
  belongs_to_active_hash :item_preparation_day
  
end
