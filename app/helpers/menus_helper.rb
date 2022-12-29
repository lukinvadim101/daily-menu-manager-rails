module MenusHelper
  def last_dish_price(dish)
    if @dish_menu_all.where(dish_id: dish.id).empty?
      @dishes.find(dish.id).price
    else
      @dish_menu_all.where(dish_id: dish.id).order('created_at DESC').first.price
    end
  end
end


