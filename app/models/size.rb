class Size < ApplicationRecord
  has_many :items, dependent: :destroy
end
