# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  describe 'POST /create' do
    let!(:user) { create(:user, email: email, password: password) }
    let(:email) { 'rodrigovdb@gmail.com' }
    let(:password) { 'rapadura' }
    let(:auth_email) { email }
    let(:auth_password) { password }
    let(:authorization) { "Basic #{Base64.encode64("#{auth_email}:#{auth_password}").strip}" }

    before do
      post '/authenticate', headers: { 'Authorization' => authorization }
    end

    context 'with valid credentials' do
      it { expect(response).to have_http_status(:success) }
    end

    context 'with invalid email' do
      let(:auth_email) { 'invalid@email.com' }

      it { expect(response).to have_http_status(:unauthorized) }
    end

    context 'with invalid password' do
      let(:auth_password) { 'passworde' }

      it { expect(response).to have_http_status(:unauthorized) }
    end
  end
end
