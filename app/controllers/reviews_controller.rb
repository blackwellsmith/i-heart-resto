class ReviewsController < ApplicationController
    before_action :current_user, only: [ :edit, :destroy]
    def index
      #determine if we're using a nested route  restaurants/1/reviews
      #or just simply going to reviews index  /reviews 
      @reviews = Review.ordered 
    end

    def new
      if params[:restaurant_id] && restaurant = Restaurant.find_by_id(params[:restaurant_id])
        @review = restaurant.reviews.build
      else
        @review = Review.new
        
      end
    end

    

    def create
      @review = Review.new(review_params)
      @review.user_id = session[:user_id]
       if @review.save
        redirect_to review_path(@review)
       else 
        render :new 
      end
    end

    def show
      if params[:review_id]
        @review = Restaurant.find(params[:id])
      else   
        find_review_by_id
      end
    end

    def edit
      find_review_by_id 
      if @review.user_id != current_user.id
        redirect_to reviews_path
      end
    end

    def update
      find_review_by_id
      @review.update(review_params)
      redirect_to review_path(@review)
    end

    def destroy
      find_review_by_id
      @review.destroy
      redirect_to reviews_path
      end

    private 

    def review_params
      params.require(:review).permit(:id, :restaurant_id, :title, :restaurant_review)  
    end

    def find_review_by_id
      @review = Review.find(params[:id])
  end
end
