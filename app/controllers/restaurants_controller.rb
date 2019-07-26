class RestaurantsController < ApplicationController

    def index
        @restaurants = Restaurant.all 
      end
  
      def new
        @restaurant = Restaurant.new
      end
  
      def create
        @restaurant = Restaurant.create(params)
      end
  
      def show
        @restaurant = Restaurant.find(params[:id])
        @reviews = @restaurant.reviews.ordered 
      end
    end