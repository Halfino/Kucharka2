Rails.application.routes.draw do
  root 'pages#home'
  get 'pages/home'
  get 'pages/recipe_list'
  get 'pages/calculated'
  get 'pages/:id', to: 'pages#recipe', as: 'recipe_public'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
