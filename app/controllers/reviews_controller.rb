class ReviewsController < ApplicationController

    def index
      @reviews = Review.all 
    end

    def new
      @review = Review.new
    end

    def create
      @review = Review.new(review_params)
     # binding.pry 
       if @review.save
        redirect_to review_path(@review)
       else 
        render :new 
      end
    end

    def show
        #binding.pry
      @review = Review.find(params[:id])
      #binding.pry
     # redirect_to review_path
    end

    private 

    def review_params
      params.require(:review).permit(:id, :user_id, :restaurant_id, :title, :restaurant_review)  
    end
end
