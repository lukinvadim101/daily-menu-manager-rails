require 'rails_helper'

RSpec.describe MenusHelper, type: :helper do
  describe 'find last dish price' do
    let(:price_type) { FactoryBot.create(:price_type) }
    let(:category) { FactoryBot.create(:category) }
    let(:dish) { FactoryBot.create(:dish, category: category, price_type: price_type) }
    let(:menu) do
      FactoryBot.create(:menu,
                        dish_menus_attributes: [
                          dish: dish,
                          price: 777,
                          included: 1
                        ])
    end

    it 'find last_dish_price by dish id' do
      dish.save
      menu.save
      expect(last_dish_price(dish.id)).to eq(777)
    end
  end
end

# based on form_index need to generate procedure

# def selected_dish(form_index)
#   dish_in_dish_menu = @dishes_in_menu[form_index]
#   dish_in_dish_menu.nil? ? Dish.all[form_index] : dish_in_dish_menu.dish
# end
