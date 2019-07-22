class Review < ApplicationRecord

    belongs_to :restaurant
    belongs_to :user

    validates :restaurant_id, :title, :restaurant_review, presence: true
    validates :restaurant_review, length: { maximum: 250 }

    scope :ordered, -> { order('created_at desc') }
    
    def find_review_by_id
        @review = Review.find(params[:id])
    end
end
