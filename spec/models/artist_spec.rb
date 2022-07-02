# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Artist, type: :model do
  subject(:artist) { build(:artist) }

  describe 'validations' do
    it { is_expected.not_to allow_value(nil).for(:first_name) }
    it { is_expected.not_to allow_value(nil).for(:last_name) }
    it { is_expected.not_to allow_value(nil).for(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
  end

  describe 'relationships' do
    it { is_expected.to have_many(:items) }
  end
end
