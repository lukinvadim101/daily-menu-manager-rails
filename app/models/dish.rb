class Dish < ApplicationRecord
  belongs_to :category
  belongs_to :price_type
  has_many :dish_menus
  has_many :menus, through: :dish_menus

  validates :name, :price, :price_type_id, presence: true
  validates :name, uniqueness: { case_sensitive: true }

  accepts_nested_attributes_for :dish_menus
  before_destroy :check_dish_in_menu  # Блюдо не может быть удалено, если оно было включено хотя бы в одно дневное меню

  def check_dish_in_menu
    return unless menus.any?

    errors.add(:base, message: 'Dish included in Menu')
    throw(:abort)
  end
end
