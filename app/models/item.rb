class Item < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  has_many :item_images, dependent: :destroy
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
  
  with_options presence: true do
    validates :name
    validates :price
    validates :status
    validates :delivery_method
    validates :delivery_from_location
    validates :item_explanation
    validates :preparation_day
    validates :delivery_fee
  end
end
