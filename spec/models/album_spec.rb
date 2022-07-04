# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Album, type: :model do
  subject(:album) { build(:album) }

  describe 'validations' do
    it { is_expected.not_to allow_value(nil).for(:name) }
    it { is_expected.not_to allow_value(nil).for(:cover_image) }
  end

  describe 'relationships' do
    it { is_expected.to belong_to(:artist) }
  end
end
