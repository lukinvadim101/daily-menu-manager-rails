# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :dishes, dependent: :restrict_with_error
  validates :name, presence: true, allow_blank: false
  validates :name, uniqueness: { case_sensitive: true }
  before_destroy :check_dish_in_category
end
