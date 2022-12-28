# frozen_string_literal: true

class Menu < ApplicationRecord
  has_many :dish_menus, dependent: :destroy
  has_many :dishes, through: :dish_menus

  validates :dish_menus, :date, presence: true
  validates :date, uniqueness: true
  validates_associated :dish_menus

  accepts_nested_attributes_for :dish_menus,
                                allow_destroy: true,
                                reject_if: proc { |attributes| attributes['included'] == '0' || blank? }

end
