# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'articles/index'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  mount Sidekiq::Web => '/sidekiq'
end
