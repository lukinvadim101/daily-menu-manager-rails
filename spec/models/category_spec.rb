require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  describe 'associations' do
    it { should have_many(:dishes) }
  end

  describe 'check_dish_in_category' do
    let(:price_type) { FactoryBot.create(:price_type) }
    let(:category) { FactoryBot.create(:category) }
    let(:dish) { FactoryBot.create(:dish, category: category, price_type: price_type) }

    it 'prevent delete Category if it contains Dishes' do
      dish.save
      category.destroy
      expect(category.errors[:base].first).to eq 'Category contain dishes'
    end
  end
end
