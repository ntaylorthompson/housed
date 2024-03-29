Housed::Application.routes.draw do
  resources :admins
  resources :payments

  get "hosts/show"
  
  resources :shows, :guests, :only => [:index]
  resources :shows, :only => [:edit]
  resources :users do
    resources :availabilities
    resources :shows do
      resources :guests do
        get 'buy', :on => :member
      end
    end
  end

  resources :hosts
    
  resources :sessions, :only => [:new, :create, :destroy]

  root :to => "pages#home"

  match '/welcome', :to => 'pages#welcome'
  
  match '/contact', :to => 'pages#contact'
  match '/story',   :to => 'pages#about'
  match '/about',   :to => 'pages#overview'  
  match '/help',    :to => 'pages#help'
  match '/email_settings', :to => 'pages#email_settings'
  match '/payment_error', :to => 'pages#payment_error'
  match '/guest_thank_you', :to => 'pages#guest_thank_you'
  match '/how_it_works', :to => 'pages#guest_instructions'
    
  match '/signup_musician',  :to => 'users#new_musician'
  match '/signup_fan',  :to => 'users#new_fan'
  match '/signup',  :to => 'users#signup'
  match '/musicians',  :to => 'users#index_musicians'
  match '/find_musicians',  :to => 'users#index_musicians_for_fans'
    
  match '/signin',  :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
      
  match '/thanks', :to => 'guests#thanks'
  
  match '/index_admin', to: 'shows#index_admin'
  
  resources :payments
    match '/confirm_payment' => 'payments#confirm'

#  match '/users/:user_id/shows/:show_id/guests/:id/buy(.:format)', :to => 'guests#buy'
  match '/users/:id/admin_edit', :to => 'users#admin_edit'
  match 'host_instructions', :to => 'pages#host_instructions'  
  match '/sample', :to => 'users#sample'
  match '/host/:web_string', :to => 'hosts#show' , :as =>'host'
  
  
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

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
