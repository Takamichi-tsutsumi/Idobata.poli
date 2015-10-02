Rails.application.routes.draw do
  devise_for :users
  root 'top#index'


  namespace :users do
    match 'manifests/:id/vote_info' => 'manifests#vote_info', as: :vote_info, :via => :get
  	resources :manifests, only: [ :new, :create, :index, :show ]
    match 'manifests/vote' => 'manifests#vote', as: :vote, :via=> :post
    match 'manifests/vote_info/:id' => 'manifests#vote_info_delete', :via=> :delete

  end

  namespace :admin do
    root 'top#index'
    match 'public_manifests/:id/register' => 'public_manifests#manifests_relation_edit', as: :manifest_relation, :via=>:get
    match 'public_manifests/:id/update' => 'public_manifests#manifests_relation_update', :via => :post
    match 'public_manifests/search' => 'public_manifests#search', as: :public_manifest_search, :via=>:get
    match 'public_manifests/:type/sort' => 'public_manifests#sort', as: :public_manifests_sort, :via=>:get
    resources :categories, except: [ :show ]
    resources :public_manifests
    resources :manifests, only: [ :show, :index, :destroy ]
  end
end

