require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'default role' do
    let(:user) { FactoryBot.create(:user) }
    it 'set up default role to "User"' do
      expect(user.role).to eq('user')
    end
  end
end
