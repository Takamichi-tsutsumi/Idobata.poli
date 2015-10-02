Rails.application.routes.draw do
  devise_for :users
  root 'top#index'

  namespace :users do
  	resources :manifests, only: [ :new, :create ]
  end

  namespace :admin do
    root 'top#index'
    resources :public_manifests
    resources :manifests
    resources :political_parties do
      member do
        get 'set_points'
        patch 'update_policy_points'
      end
    end
    resources :questions
    resources :question_sets
  end
end
