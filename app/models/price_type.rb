class PriceType < ApplicationRecord
  has_many :dishes
  validates :measurement, :portion, presence: true
  validates :portion, numericality: { greater_than: 0, less_than_or_equal_to: 1 }
end
