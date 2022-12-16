class RemoveDishIdFromPriceTypes < ActiveRecord::Migration[6.0]
  def change
    remove_column :price_types, :dish_id, :integer
  end
end
