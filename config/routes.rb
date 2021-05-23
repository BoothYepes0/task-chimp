# frozen_string_literal: true

Rails.application.routes.draw do

  resources :tasks
  devise_for :users
end
