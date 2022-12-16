require 'rails_helper'

RSpec.describe PriceType, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:measurement) }
    it { should validate_presence_of(:portion) }
    it { should validate_numericality_of(:portion).is_greater_than(0).is_less_than_or_equal_to(1) }
  end

  describe 'associations' do
    it { should have_many :dishes }
  end
end
