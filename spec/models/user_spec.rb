# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { create(:user, email: email, password: password) }

  let(:email) { 'rodrigovdb@gmail.com' }
  let(:password) { 'rapadura' }

  describe '.authenticate' do
    subject(:authenticated_user) { described_class.authenticate(auth_email, auth_password) }

    let(:auth_email) { user.email }
    let(:auth_password) { password }

    context 'whith valid credentials' do
      it { is_expected.to eq(user) }
    end

    context 'with email does not exist' do
      let(:auth_email) { 'inexistent@email.com' }

      it { is_expected.to be_falsey }
    end

    context 'with email does not exist' do
      let(:auth_password) { 'wrong-password' }

      it { is_expected.to be_falsey }
    end
  end
end
