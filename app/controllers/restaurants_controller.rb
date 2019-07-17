class RestaurantsController < ApplicationController

    def index
        @restaurants = Restaurant.all 
      end
  
      def new
        @restaurant = Restaurant.new
      end
  
      def create
        @restaurant = Restaurant.create(params)
         # redirect_to review_path(@review)
      end
  
      def show
      end
    end