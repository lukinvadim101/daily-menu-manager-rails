class CreateDishes < ActiveRecord::Migration[6.0]
  def change
    create_table :dishes do |t|
      t.string  :name
      t.integer :category_id
      t.string  :price_type
      t.integer :price

      t.timestamps
    end
  end
end
