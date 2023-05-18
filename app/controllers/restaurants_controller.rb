class RestaurantsController < ApplicationController
  def index
    # Retrieve all restaurants
    @restaurants = Restaurant.all
  end

  def new
    # Create a new restaurant instance for the form
    @restaurant = Restaurant.new
  end

  def create
    # Create a new restaurant with the submitted parameters
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      # Redirect to the show view of the new restaurant
      redirect_to restaurant_path(@restaurant)
    else
      # Handle validation errors and render the new view again
      render :new
    end
  end

  def show
    # Find the restaurant and retrieve its reviews
    @restaurant = Restaurant.find(params[:id])
    @reviews = @restaurant.reviews
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category)
  end
end
