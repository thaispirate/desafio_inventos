Rails.application.routes.draw do
  get 'static_pages/...'

  get 'static_pages/home'

  get 'static_pages/help'

  devise_for :users
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "home#index"
  resources :useradmins
  root 'users#index'
end
