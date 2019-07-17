class Review < ApplicationRecord

    belongs_to :restaurant
    belongs_to :user

    validates :restaurant_name, :restaurant_review, presence: true
    validates :restaurant_review, length: { maximum: 250 }
end
