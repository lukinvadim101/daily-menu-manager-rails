class RenamePriceTypeToPriceTypeId < ActiveRecord::Migration[6.0]
  def change
    rename_column :dishes, :price_type, :price_type_id
  end
end
