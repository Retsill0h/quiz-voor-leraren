Rails.application.routes.draw do
  resources :questions
  resources :chapters
  resources :results
  namespace :admin do
    root to: "admin/chapters#index"
    resources :chapters
    resources :questions
  end
root 'admin/chapters#index'
end
