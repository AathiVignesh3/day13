Rails.application.routes.draw do
  devise_for :users
  resources :tasks
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "home#index"
  get "home/task_mailer"
  # Defines the root path route ("/")
  # root "articles#index"
end
