require 'rails_helper'

RSpec.describe DishMenu, type: :model do
  describe 'uniqueness' do
    it { should validate_uniqueness_of(:dish_id).scoped_to(:menu_id) }
  end

  describe 'associations' do
    it { should belong_to :dish }
    it { should belong_to :menu }
    it { should accept_nested_attributes_for(:dish) }
  end
end
