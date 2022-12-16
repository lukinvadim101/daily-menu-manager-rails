class DishesController < ApplicationController
  before_action :dish, only: %i[update show destroy edit]
  before_action :is_admin?, only: %i[create update destroy edit]

  def create
    @dish = Dish.create(dish_params)

    if @dish.save
      redirect_to @dish, notice: 'Dish was created'
    else
      redirect_to :new, alert: @dish.errors.full_messages.join(', ')
    end
  end

  def update
    if @dish.update(dish_params)
      redirect_to @dish, notice: 'Dish was updated'
    else
      redirect_to :new, alert: @dish.errors.full_messages.join(', ')
    end
  end

  def destroy
    if @dish.destroy
      redirect_to :index, notice: 'Dish was destroyed'
    else
      redirect_to :index, alert: @dish.errors.full_messages.join(', ')
    end
  end

  def show
    @category = @dish.category
  end

  def new
    @dish = Dish.new
  end

  def index
    @dishes = Dish.all
  end

  def edit; end

  private

  def dish_params
    params.require(:dish).permit(:name, :price, :price_type_id, :category_id)
  end

  def dish
    @dish = Dish.find(params[:id])
  end
end
