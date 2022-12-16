require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:category) { FactoryBot.build(:category) }
  context 'for Admin' do
    login_admin
    describe 'Redirect after CRUD operations ' do
      it '#create' do
        post :create, params: {
          category: { name: category.name }
        }
        expect(response).to redirect_to(assigns(:category))
      end

      it '#update' do
        category.save
        patch :update, params: {
          category: { name: category.name },
          id: category.id
        }
        expect(response).to redirect_to(:category)
      end

      it '#destroy' do
        category.save
        delete :destroy, params: {
          category: { name: category.name },
          id: category.id
        }
        expect(response).to redirect_to(:index)
      end
    end
  end
  context 'for User' do
    login_user
    describe 'Prevent access for CRUD operations' do
      it '#update' do
        category.save
        patch :update, params: {
          category: { name: category.name },
          id: category.id
        }
        expect(response).not_to be_successful
      end

      it '#delete' do
        category.save
        delete :destroy, params: {
          category: { name: category.name },
          id: category.id
        }
        expect(response).not_to be_successful
      end

      it '#create' do
        post :create, params: {
          category: { name: category.name }
        }
        expect(response).not_to be_successful
      end
    end
  end
end
