class DishesController < ApplicationController
  def index
    @dishes = Dish.all
  end

  def new
    @dish = Dish.new
  end

  def create
    Dish.create(dish_params)
  end

  private

  def dish_params
    params.require(:dish).permit(:name, :title, :body)
  end

end