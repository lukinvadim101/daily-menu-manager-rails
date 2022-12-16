class ChangePriceTypeToInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :dishes, :price_type, :integer
  end
end
