class AddUniqueIndexToNesting < ActiveRecord::Migration[6.0]
  def change
    add_index :dish_menus, %i[dish_id menu_id], unique: true
  end
end
