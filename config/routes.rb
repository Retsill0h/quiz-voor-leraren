Rails.application.routes.draw do
  resources :questions
  resources :chapters
  resources :results
  namespace :admin do
    root to: "home#index"
    resources :chapters
    resources :questions
  end
root 'home#index'
end
