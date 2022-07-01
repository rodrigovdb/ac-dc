require 'rails_helper'

RSpec.describe Item, type: :model do
  subject(:item) { build(:item) }

  describe 'validations' do
    it { is_expected.not_to allow_value(nil).for(:title) }
  end

  describe 'relationships' do
    it { is_expected.to belong_to(:artist) }
  end
end
