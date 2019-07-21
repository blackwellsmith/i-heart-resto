class ReviewsController < ApplicationController

    def index
      #determine if we're using a nested route  restaurants/1/reviews
      #or just simply going to reviews index  /reviews 
      @reviews = Review.all 
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
    # 
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
        @review = Review.find(params[:id])
      end
    end

    #def index
      #if params[:author_id]
      #  @posts = Author.find(params[:author_id]).posts
     # else
     #   @posts = Post.all
    #  end
   # end

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
