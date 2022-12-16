class ChangeDishPriceToFloat < ActiveRecord::Migration[6.0]
  def change
    change_column :dish_menus, :price, :float
  end
end
