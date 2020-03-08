class DishesController < ApplicationController
  def index
  end

  def new
    @dish = Dish.new
  end
end