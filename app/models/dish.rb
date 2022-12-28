class Dish < ApplicationRecord
  belongs_to :category
  belongs_to :price_type
  has_many :dish_menus, dependent: :restrict_with_error
  has_many :menus, through: :dish_menus

  validates :name, :price_type_id, presence: true
  validates :price, presence: true, numericality: true
  validates :name, uniqueness: { case_sensitive: true }

  accepts_nested_attributes_for :dish_menus
end
