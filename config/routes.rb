# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sessions, only: [] do
    collection do
      post :login
      post :logout
      post :signup
    end
  end
end
