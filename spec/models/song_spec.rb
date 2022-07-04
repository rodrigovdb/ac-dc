# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Song, type: :model do
  subject(:song) { build(:song) }

  describe 'validations' do
    it { is_expected.not_to allow_value(nil).for(:name) }
  end

  describe 'relationships' do
    it { is_expected.to belong_to(:album) }
  end
end
