# frozen_string_literal: true

class MenusController < ApplicationController
  before_action :menu, only: %i[edit show update destroy]
  before_action :dishes, only: %i[edit new index destroy]

  def new
    @menu = Menu.new
    @dishes_in_menu = @menu.dishes
    @dish_menu_all = DishMenu.all
    @dishes.count.times { @menu.dish_menus.build }
  end

  def index
    @menus = Menu.order(date: :desc)
  end

  def edit
    @dishes_in_menu = @menu.dish_menus
    @dish_menu_all = DishMenu.all
  end

  def destroy
    if @menu.destroy
      redirect_to root_path, notice: 'Menu was destroyed'
    else
      redirect_to menus_path, alert: @menu.errors.full_messages.join(',')
    end
  end

  def update
    @menu.update(menu_params)
    if @menu.save
      redirect_to root_path, notice: 'Menu was updated'
    else
      redirect_to :index, alert: @menu.errors.full_messages.join(',')
    end
  end

  def create
    @menu = Menu.create(menu_params)
    if @menu.save
      redirect_to root_path, notice: 'Menu was created'
    else
      redirect_to :index, alert: @menu.errors.full_messages.join(',')
    end
  end

  def show; end

  private

  def menu
    @menu = Menu.find(params[:id])
  end

  def dishes
    @dishes = Dish.all
  end

  def menu_params
    params.require(:menu).permit(:date, :id, dish_menus_attributes: %i[dish_id price menu_id included id _destroy])
  end
end
