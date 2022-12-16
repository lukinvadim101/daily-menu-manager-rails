require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:price_type_id) }
  end

  describe 'uniqueness' do
    it {
      create(:category)
      create(:price_type)
      create(:dish)
      should validate_uniqueness_of(:name)
    }
  end

  describe 'associations' do
    it { should belong_to :category }
    it { should belong_to :price_type }
    it { should have_many :dish_menus }
    it { should have_many :menus }
    it { should accept_nested_attributes_for(:dish_menus) }
  end

  describe 'check_dish_in_menu' do
    let(:price_type) { FactoryBot.create(:price_type) }
    let(:category) { FactoryBot.create(:category) }
    let(:dish) { FactoryBot.create(:dish, category: category, price_type: price_type) }
    let(:menu) do
      FactoryBot.create(:menu,
                        dish_menus_attributes: [
                          dish: dish,
                          included: 1
                        ])
    end

    it 'prevent delete Dish if it included in menu' do
      menu.save
      dish.destroy
      expect(dish.errors[:base].first).to eq 'Dish included in Menu'
    end
  end
end
