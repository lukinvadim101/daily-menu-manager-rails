class DropMenuDishes < ActiveRecord::Migration[6.0]
  def change
    drop_table :menu_dishes
  end
end
