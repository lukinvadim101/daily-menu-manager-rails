class HomeController < ApplicationController
  def index
    @menus = Menu.order(:date).all
    @dishes = Dish.all
    @categories = Category.all
  end
end
