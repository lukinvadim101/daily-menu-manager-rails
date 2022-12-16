class Menu < ApplicationRecord
  has_many :dish_menus, dependent: :destroy
  has_many :dishes, through: :dish_menus

  validates :dish_menus, :date, presence: true
  validates :date, uniqueness: true

  accepts_nested_attributes_for :dish_menus,
                                allow_destroy: true,
                                reject_if: proc { |attributes| attributes['included'] == '0' || blank? }

  before_create :dish_menus_duplicates?

  private

  def dish_menus_duplicates?
    return if dish_menus.group_by { |h| h[:dish_id] }.values.select { |a| a.size > 1 }.blank?

    errors.add(:base, message: 'Dish Duplication')
    throw(:abort)
  end
end
