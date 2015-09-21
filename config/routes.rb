Rails.application.routes.draw do
  devise_for :users
  root 'top#index'


  namespace :users do
  	resources :manifests, only: [ :new, :create, :index, :show ]
# <<<<<<< HEAD
# =======
# >>>>>>> 2dad334c17704f005955953419df41c8496cc825
    post 'manifests/vote/:id' => 'manifests#vote', as: :vote
  end

  namespace :admin do
    root 'top#index'
    resources :categories, except: [ :show ]
    resources :public_manifests
    resources :manifests, only: [ :show, :index, :destroy ]
  end
end
