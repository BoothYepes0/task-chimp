# frozen_string_literal: true

Rails.application.routes.draw do

  root to: "home#index"
  #get 'home/index'
  resources :tasks do
    
    # member - these are the routes which require the ID of the resource (becasue a member can only return a single instance - a single task)
    member do
      patch :task_completion
    end

    # collection - routes which return multiple instances of resources, hence it does not require any ID
    collection do
      get :completed_tasks
    end
  end
  devise_for :users

end
