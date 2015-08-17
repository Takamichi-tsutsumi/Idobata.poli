Rails.application.routes.draw do
  devise_for :users
  root 'top#index'
  namespace :admin do
    root 'top#index'
  end
end
