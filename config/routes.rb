require 'main_domain_constraint'
require 'personalized_domain_constraint'

Heritage::Application.routes.draw do

  get "photos/create"
  get "photos/destroy"

  devise_for :users

  namespace :as do |sd|
    resources :photos do as_routes end
    resources :users do as_routes end
    resources :stories do as_routes end
    resources :emails do as_routes end
  end

  resources :stories do
    resources :photos, :only => [:create, :destroy, :edit, :update, :show] do
      member do
        get :purchase
      end
    end
    member do
      post :sort
      get :editlong
      get :thumbs
      put :updatelong
    end
  end

  resources :emails, :only => [:create, :index, :destroy] do
    collection do
      get :export
    end
  end

  resources :photographers do
    member do
      post :sort
      get :about
      get :contact
    end
  end

  resource :shop

  resource :cart do
    member do
      post :add
      put :add
    end
  end

  resource :account do
    member do
      get :social_medias
      get :website
      get :stories
    end
    resources :available_sizes
    resources :coupons
    put :update_avatar
    put :update_main_photo
    delete :delete_main_photo
  end

  constraints :subdomain => "admin" do
    root :to => "admin#index"
  end

  constraints(PersonalizedDomainConstraint.new) do
    match 'about' => 'photographers#about'
    match 'contact' => 'photographers#contact'
    root :to => "photographers#show"
  end

  constraints(MainDomainConstraint.new) do
    root :to => "heritage#index"
  end

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id))(.:format)'
end
