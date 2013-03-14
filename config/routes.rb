require 'main_domain_constraint'
require 'personalized_domain_constraint'

Heritage::Application.routes.draw do
  resources :oauth_clients

  match '/oauth/test_request',  :to => 'oauth#test_request',  :as => :test_request

  match '/oauth/token',         :to => 'oauth#token',         :as => :token

  match '/oauth/access_token',  :to => 'oauth#access_token',  :as => :access_token

  match '/oauth/request_token', :to => 'oauth#request_token', :as => :request_token

  match '/oauth/authorize',     :to => 'oauth#authorize',     :as => :authorize

  match '/oauth',               :to => 'oauth#index',         :as => :oauth

  get "photos/create"

  get "photos/destroy"

  devise_for :users

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  namespace :as do |sd|
    resources :photos do as_routes end
    resources :users do as_routes end
    resources :stories do as_routes end
    resources :emails do as_routes end
  end

  resources :stories do
    resources :photos, :only => [:create, :destroy, :edit, :update, :show]
    member do
      post :sort
      get :editlong
      put :updatelong
    end
  end

  resources :emails, :only => [:create, :index] do
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

  resource :account do
    member do
      get :social_medias
      get :website
      get :stories
    end
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
