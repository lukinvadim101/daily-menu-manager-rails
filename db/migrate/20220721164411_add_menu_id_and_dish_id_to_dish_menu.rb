class AddMenuIdAndDishIdToDishMenu < ActiveRecord::Migration[6.0]
  def change
    add_column :dish_menus, :dish_id, :integer
    add_column :dish_menus, :menu_id, :integer
  end
end
