class DishesController < ApplicationController
  before_action :set_target_dish, only: %i[show edit update destroy]

  def index
    @q = params[:tag_id].present? ? Tag.find(params[:tag_id]).dishes : Dish.all
    @search = @q.ransack(params[:q])
    @dishes = @search.result(distinct: true).page(params[:page]).per(7)

    respond_to do |format|
      format.html
      format.csv { send_data @dishes.generate_csv, filename: "dishes-#{Time.zone.now.strftime('%Y%m%d%S')}.csv"}
    end
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
    @comment = Comment.new(dish_id: @dish.id)
  end

  def edit
  end

  def update
    if @dish.update(dish_params)
      redirect_to @dish
    else
      redirect_to edit_dish_path, flash: {
        dish: @dish,
        error_messages: @dish.errors.full_messages
      }
    end
  end

  def destroy
    @dish.destroy
    redirect_to dishes_path, flash: { notice: "「#{@dish.title}」の料理が削除されました" }
  end

  private

  def dish_params
    params.require(:dish).permit(:name, :title, :body, :image, tag_ids: []).merge(user_id: current_user.id)
  end

  def set_target_dish
    @dish = Dish.find(params[:id])
  end

end