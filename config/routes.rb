Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
  devise_for :users
  resources :tasks
  resources :users
  root "home#index"
  end
end
