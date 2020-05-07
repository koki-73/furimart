class Item < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes
  has_many :item_images
  has_many :user_rates
  belongs_to :user
  belongs_to :category
  belongs_to :size
  belongs_to :brand
  belongs_to :buyer, class_name: "User"
  accepts_nested_attributes_for :item_images, allow_destroy: true
end
