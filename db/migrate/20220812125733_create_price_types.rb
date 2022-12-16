class CreatePriceTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :price_types do |t|
      t.integer :dish_id
      t.string :measurement
      t.float :portion
      t.string :comment

      t.timestamps
    end
  end
end
