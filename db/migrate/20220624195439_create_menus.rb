class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.date :date
      t.string :dishes

      t.timestamps
    end
  end
end
