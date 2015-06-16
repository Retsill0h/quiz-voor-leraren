Rails.application.routes.draw do
  resources :questions
  resources :chapters
  resources :results
  namespace :admin do
    root to: "users#index"
    resources :chapters
    resources :questions
  end
root 'users#index'
end
