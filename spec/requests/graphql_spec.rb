# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GraphQL', type: :request do
  describe 'POST /graphql' do
    let(:headers) { {} }
    let(:variables) { {} }
    let(:query) do
      <<-QUERY
      {
        albums {
          id
          name
          year
          coverImage
        }
      }
      QUERY
    end

    before do
      post '/graphql', headers: headers, params: { query: query, variables: variables }
    end

    context 'when operation is not protected' do
      it { expect(response).to have_http_status(:success) }
    end

    context 'when operation is protected' do
      let(:query) do
        <<-QUERY
      mutation AlbumCreate($name: String!, $year: Int!, $coverImage: String!){
        albumCreate(
          input: {
            name: $name,
            year: $year,
            coverImage: $coverImage
          }
        ) {
          id
          name
          year
          coverImage
        }
      }
        QUERY
      end
      let(:name) { Faker::Music.album }
      let(:year) { (1950..2020).to_a.sample }
      let(:cover_image) { Faker::Internet.url(path: '/cover.jpg') }
      let(:variables) do
        { name: name,
          year: year,
          coverImage: cover_image }
      end

      let(:current_date) { DateTime.new(2022, 12, 13, 14, 15, 16) }

      around do |example|
        Timecop.freeze(current_date) { example.run }
      end

      let(:user) { create(:user, :with_token) }
      let(:headers) { { 'Authorization' => "Bearer #{user.authorization_token}" } }

      context 'when user is authorized' do
        it { expect(response).to have_http_status(:success) }
      end

      context 'when user is not authorized' do
        let(:user) { create(:user, :with_expired_token) }

        it { expect(response).to have_http_status(:unauthorized) }
      end
    end
  end
end
