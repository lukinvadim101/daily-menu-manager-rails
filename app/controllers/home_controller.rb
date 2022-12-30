class HomeController < ApplicationController
  def index
    @menus = Menu.order(date: :desc)
    @dishes = Dish.all
    @categories = Category.all
  end
end
