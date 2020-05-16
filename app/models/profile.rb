class Profile < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :item_prefecture

  with_options presence: true do
    validates :post_code
    validates :prefecture_id
    validates :city
    validates :address
  end

  mount_uploader :image, ImageUploader
end
