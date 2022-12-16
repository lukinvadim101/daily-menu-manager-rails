# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MenusController, type: :controller do
  let(:price_type) { FactoryBot.create(:price_type) }
  let(:category) { FactoryBot.create(:category) }
  let(:dish) { FactoryBot.create(:dish, category: category, price_type: price_type, id: 111) }
  let(:menu) do
    FactoryBot.create(:menu,
                      dish_menus_attributes: [
                        dish: dish,
                        price: 777,
                        included: 1
                      ])
  end

  context 'For Admin User' do
    login_admin
    describe 'Redirect after CRUD operations' do
      it '#create' do
        post :create, params: {

          menu: { date: '10-10-10',
                  dish_menus_attributes: [
                    dish_id: dish.id,
                    menu_id: 11,
                    included: 1,
                    price: 111
                  ] }
        }

        expect(response).to redirect_to(assigns(:menu))
      end

      it '#update' do
        menu.save
        patch :update, params: {
          menu: {
            date: '11-11-2011'
          },
          id: menu.id
        }

        expect(response).to redirect_to(:menu)
      end

      it '#delete' do
        menu.save
        delete :destroy, params: {
          menu: {
            date: '11-11-2011'
          },
          id: menu.id
        }

        expect(response).to redirect_to(root_path)
      end
    end
  end
  context 'For regular User' do
    login_user
    describe 'Have no access for CRUD operations' do
      it '#delete' do
        menu.save
        delete :destroy, params: {
          menu: {
            date: '11-11-2011'
          },
          id: menu.id
        }
        expect(response).not_to be_successful
      end

      it '#update' do
        menu.save
        patch :update, params: {
          menu: {
            date: '11-11-2011'
          },
          id: menu.id
        }

        expect(response).not_to be_successful
      end

      it '#create' do
        post :create, params: {

          menu: { date: '10-10-10',
                  dish_menus_attributes: [
                    dish_id: dish.id,
                    menu_id: 11,
                    included: 1,
                    price: 111
                  ] }
        }

        expect(response).not_to be_successful
      end
    end
  end
end

# RSpec.describe 'Static content', type: :system do
#   it 'shows the static text' do
#     visit static_index_path
#     expect(page).to have_content('Hello world')
#   end
# end
