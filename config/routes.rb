Rails.application.routes.draw do
  get 'admin/chapters/index'
  root 'admin/chapters#index'
  resources :chapters, :questions
namespace :admin do
    resources :chapters, :questions
end

end
