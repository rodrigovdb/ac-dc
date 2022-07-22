# frozen_string_literal: true

Rails.application.routes.draw do
  # devise_for :users
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/your/endpoint' if Rails.env.development?

  post '/graphql', to: 'graphql#execute'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post '/authenticate', to: 'sessions#create'
end
