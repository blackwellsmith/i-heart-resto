class ReviewsController < ApplicationController

    def index
      @reviews = Review.all 
    end

    def new
      @review = Review.new
    end

    def create
      @review = Review.create(review_params)
        redirect_to review_path(@review)
    end

    def show
        #binding.pry
      @review = Review.find_by(params[:id]) 
    end

    private 

    def review_params
      params.require(:review).permit(:restaurant_name, :restaurant_review)  
    end
end
