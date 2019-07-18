class Review < ApplicationRecord

    belongs_to :restaurant
    belongs_to :user

    validates :user_id, :restaurant_id, :title, :restaurant_review, presence: true
    validates :restaurant_review, length: { maximum: 250 }
end
