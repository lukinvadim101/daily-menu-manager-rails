class HomeController < ApplicationController
  def index
    @menus = Menu.all
    @dishes = Dish.all
    @categories = Category.all
  end
end
