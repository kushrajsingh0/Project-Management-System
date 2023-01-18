Rails.application.routes.draw do
  get 'home/index'
  get 'admin/login'
  post 'admin/login'
  get 'admin/logout'
  get 'home/updateStatus/:task/:statusVal', to: 'home#updateStatus'
  get 'home/postComment'
  
  resources :projects do
    resources :tasks
  end
  namespace :project do
    resources :tasks
  end
  devise_for :users 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "projects#index"
end
