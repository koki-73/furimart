class Item < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  has_many :item_images, dependent: :destroy
  has_many :user_rates
  belongs_to :user
  belongs_to :category
  belongs_to :size
  belongs_to :brand
  belongs_to :buyer, class_name: "User"
end
