class ItemImage < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :item

  mount_uploader :image, ImageUploader
end

#  = @item.item_images.each do |image|