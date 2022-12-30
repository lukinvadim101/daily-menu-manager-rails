class HomeController < ApplicationController
  def index
    @menus = Menu.order(date: :desc)
    @dishes = Dish.allgit
    @categories = Category.all
  end
end
