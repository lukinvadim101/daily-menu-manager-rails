# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DishesController, type: :controller do
  let(:price_type) { FactoryBot.create(:price_type) }
  let(:category) { FactoryBot.create(:category) }
  let(:dish) { FactoryBot.build(:dish, category: category, price_type: price_type) }
  context 'For Admin' do
    login_admin
    describe 'Redirect after CRUD operations' do
      it '#create' do
        post :create, params: {
          dish: { name: dish.name,
                  price: dish.price,
                  price_type_id: price_type.id,
                  category_id: category.id }
        }
        expect(response).to redirect_to(assigns(:dish))
      end

      it '#update' do
        dish.save
        patch :update, params: {
          dish: { name: dish.name,
                  price: dish.price,
                  price_type_id: price_type.id,
                  category_id: category.id },
          id: dish.id
        }
        expect(response).to redirect_to(:dish)
      end

      it '#destroy' do
        dish.save
        delete :destroy, params: {
          dish: { name: dish.name,
                  price: dish.price,
                  price_type_id: price_type.id,
                  category_id: category.id },
          id: category.id
        }
        expect(response).to redirect_to(:index)
      end
    end
  end

  context 'For User' do
    describe 'Prevent access for CRUD operations' do
      login_user

      it '#create' do
        post :create, params: {
          dish: { name: dish.name,
                  price: dish.price,
                  price_type_id: price_type.id,
                  category_id: category.id }
        }
        expect(response).not_to be_successful
      end
      it '#destroy' do
        dish.save
        delete :destroy, params: {
          dish: { name: dish.name,
                  price: dish.price,
                  price_type_id: price_type.id,
                  category_id: category.id },
          id: category.id
        }
        expect(response).not_to be_successful
      end

      it '#create' do
        dish.save
        post :create, params: {
          dish: { name: dish.name,
                  price: dish.price,
                  price_type_id: price_type.id,
                  category_id: category.id }
        }
        expect(response).not_to be_successful
      end
    end
  end
end
