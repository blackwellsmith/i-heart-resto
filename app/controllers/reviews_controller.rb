class ReviewsController < ApplicationController

    def index
      #determine if we're using a nested route  restaurants/1/reviews
      #or just simply going to reviews index  /reviews 
      @reviews = Review.all 
    end

    def new
      @review = Review.new
    end

    def create
      @review = Review.new(review_params)
    # 
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

    def edit
      @review = Review.find(params[:id])
     
    end

    def update
      @review = Review.find(params[:id])
      @review.update(review_params)
      redirect_to review_path(@review)
    end

    def destroy
      @review = Review.find(params[:id])
      @review.destroy
      redirect_to reviews_path
    end

    private 

    def review_params
      params.require(:review).permit(:id, :user_id, :restaurant_id, :title, :restaurant_review)  
    end
end
