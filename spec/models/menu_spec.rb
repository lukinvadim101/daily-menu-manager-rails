# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Menu, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:dish_menus) }
    it { should validate_presence_of(:date) }
  end

  describe 'uniqueness' do
    it { should validate_uniqueness_of(:date) }
  end

  describe 'associations' do
    it { should have_many :dish_menus }
    it { should have_many :dishes }
    it { should accept_nested_attributes_for(:dish_menus).allow_destroy(true) }
  end

  describe 'dish_menus_duplicates?' do
    let(:price_type) { FactoryBot.create(:price_type) }
    let(:category) { FactoryBot.create(:category) }
    let(:dish) { FactoryBot.create(:dish, category: category, price_type: price_type) }
    let(:menu) do
      FactoryBot.build(:menu, dish_menus_attributes: [{ dish: dish, price: 101,
                                                        included: 1 },
                                                      { dish: dish, price: 101,
                                                        included: 1 }])
    end

    it 'prevent to add duplicated Dish in same menu' do
      menu.save
      expect(menu.errors[:base].first).to eq 'Dish Duplication'
    end
  end
end
