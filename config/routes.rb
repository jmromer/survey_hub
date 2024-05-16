# frozen_string_literal: true

Rails.application.routes.draw do
  resources :surveys, only: %i[index show new create update]

  root to: "surveys#index"
end
