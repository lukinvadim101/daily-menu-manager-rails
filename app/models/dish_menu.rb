class DishMenu < ApplicationRecord
  belongs_to :dish
  belongs_to :menu
  validates :dish_id, uniqueness: { scope: %i[menu_id] }  # validated duplicated dishes in single menu

  accepts_nested_attributes_for :dish
end
