# frozen_string_literal: true

Rails.application.routes.draw do
  resources :surveys, only: %i[index show new create] do
    resources :responses, only: %i[create]
  end

  root to: "surveys#index"
end
