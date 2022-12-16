# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :dishes
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: true }
  before_destroy :check_dish_in_category # Категория не может быть удалена, если ей принадлежит хотя бы одно блюдо

  def check_dish_in_category
    return unless dishes.any?

    errors.add(:base, message: 'Category contain dishes')
    throw(:abort)
  end
end
