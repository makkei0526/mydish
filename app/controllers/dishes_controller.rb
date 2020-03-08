class DishesController < ApplicationController
  before_action :set_target_dish, only: %i[show edit update destroy]

  def index
    @dishes = Dish.page(params[:page])
  end

  def new
    @dish = Dish.new
  end

  def create
    dish = Dish.create(dish_params)
    redirect_to dish
  end

  def show
  end

  def edit
  end

  def update
    @dish.update(dish_params)
    redirect_to @dish
  end

  def destroy
    @dish.delete
    redirect_to dishes_path
  end

  private

  def dish_params
    params.require(:dish).permit(:name, :title, :body)
  end

  def set_target_dish
    @dish = Dish.find(params[:id])
  end
end