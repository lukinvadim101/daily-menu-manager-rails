class DishMenu < ApplicationRecord
  belongs_to :dish
  belongs_to :menu
  validates :dish_id, uniqueness: { scope: %i[menu_id] }
  validates :price, presence: true, numericality: true

  accepts_nested_attributes_for :dish
end
