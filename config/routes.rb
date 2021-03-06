Rails.application.routes.draw do
  resources :questions
  get 'questions/:id/submit_answer', to: 'questions#submit_answer', as: 'submit_answer'
  resources :chapters
  resources :results
  resources :users
  namespace :admin do
    root to: "chapters#index"
    resources :chapters
    resources :questions
  end
root 'users#index'
end
