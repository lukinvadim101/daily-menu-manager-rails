class AddIncludedToDishMenus < ActiveRecord::Migration[6.0]
  def change
    add_column :dish_menus, :included, :boolean
  end
end
