class DishesController < ApplicationController
  def index
  end

  def new
    @dish = Dish.new
  end

  def create
    dish.create(dish_params)
  end

  private

  def dish_params
    params.require(:dish).permit(:name, :title, :body)
  end
  
end