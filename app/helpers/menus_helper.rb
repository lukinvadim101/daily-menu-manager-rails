module MenusHelper
  def last_dish_price(dish_id)
    dish_in_menu = DishMenu.where(dish_id: dish_id)
    dish_in_menu.exists? ? dish_in_menu.to_a { |e| e[:date] }.last[:price] : Dish.find(dish_id).price
  end

  def selected_dish(form_index)
    dish_in_dish_menu = @dishes_in_menu[form_index]
    dish_in_dish_menu.nil? ? Dish.all[form_index] : dish_in_dish_menu.dish
  end

  def dish_price(form_index)
    dish_in_dish_menu = @dishes_in_menu[form_index]
    dish_in_dish_menu.nil? ? last_dish_price(Dish.all[form_index].id) : dish_in_dish_menu.price
  end
end
