require 'rails_helper'

RSpec.feature 'Dish Price Management', type: :feature do
  context 'dish_price' do
    scenario 'Find original dish price' do
      user = FactoryBot.create(:user, role: 1)
      price_type = FactoryBot.create(:price_type)
      category = FactoryBot.create(:category)
      dish = FactoryBot.create(:dish, category: category, price_type: price_type, id: 111, price: 555)
      visit new_user_session_path

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_on 'Log in'
      expect(page.status_code).to be(200)

      visit 'menus/new'

      dish_original_price = find_field('Price').value
      expect(dish_original_price).to have_text(555)
    end

    scenario 'Find dish price from last menu it was' do
      user = FactoryBot.create(:user, role: 1)
      price_type = FactoryBot.create(:price_type)
      category = FactoryBot.create(:category)
      dish = FactoryBot.create(:dish, category: category, price_type: price_type, id: 111, price: 555)
      menu = FactoryBot.create(:menu,
                               dish_menus_attributes: [
                                 dish: dish,
                                 price: 777,
                                 included: 1
                               ])
      visit new_user_session_path

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_on 'Log in'
      expect(page.status_code).to be(200)

      visit 'menus/new'

      dish_original_price = find_field('Price').value
      expect(dish_original_price).to have_text(777)
    end
  end
  context 'selected_dish' do
    scenario '"select" value relates to specific dish id' do
      user = FactoryBot.create(:user, role: 1)
      price_type = FactoryBot.create(:price_type)
      category = FactoryBot.create(:category)
      dish = FactoryBot.create(:dish, category: category, price_type: price_type, id: 111, price: 555)

      visit new_user_session_path

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_on 'Log in'
      expect(page.status_code).to be(200)

      visit 'menus/new'

      selected_dish_id = find_field('menu_dish_menus_attributes_0_dish_id').value
      expect(selected_dish_id).to have_text(dish.id)
    end
  end
end
