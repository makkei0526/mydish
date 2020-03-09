class DishesController < ApplicationController
  before_action :set_target_dish, only: %i[show edit update destroy]

  def index
    @dishes = Dish.page(params[:page])
  end

  def new
    @dish = Dish.new
  end

  def create
    dish = Dish.new(dish_params)
    if dish.save
      flash[:notice] = "「#{dish.title}」の料理を作成しました"
      redirect_to dish
    else
      redirect_to new_dish_path, flash: {
        dish: dish,
        error_messages: dish.errors.full_messages
      }
    end
  end

  def show
    @comment = @dish.comments.new
  end

  def edit
  end

  def update
    @dish.update(dish_params)
    redirect_to @dish
  end

  def destroy
    @dish.delete
    redirect_to dishes_path, flash: { notice: "「#{@dish.title}」の料理が削除されました" }
  end

  private

  def dish_params
    params.require(:dish).permit(:name, :title, :body)
  end

  def set_target_dish
    @dish = Dish.find(params[:id])
  end
end