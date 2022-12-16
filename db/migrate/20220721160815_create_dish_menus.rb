class CreateDishMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :dish_menus do |t|
      t.integer :price

      t.timestamps
    end
  end
end
