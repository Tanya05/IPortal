  Rails.application.routes.draw do
  devise_for :user, :controllers => { registrations: 'registrations' }
  root 'user#home'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get 'user/editprofile' => 'user#edit'
  get 'user/profile' => 'user#profile'

  get 'ip/myIps' => 'ip#my_ips'
  get 'ip/info' => 'ip#ip_info'
  post 'ip/show' => 'ip#show'
  get 'ip/licensing' => 'ip#license'
  get 'contract/create' => 'contract#new'
  post 'contract/create' => 'contract#create'
  get 'about' => 'user#about'
  get 'user/earnings' => 'user#earnings'
  get 'ip/upload_ip' => 'uploads#new'
  post 'ip/upload_ip' => 'uploads#create'
  get 'admin' => 'admin#home'
  get 'admin/about' => 'admin#about'
  get 'admin/earnings' => 'admin#earnings'
  get 'admin/viewall' => 'admin#viewall'
  match '/admin/:id' => 'admin#user_destroy', :via => :delete, :as => :admin_user_destroy
  get 'admin/createuser' => 'admin#createuser'
  post 'admin/createuser' => 'admin#create'
  #get 'admin/createuser' => 'devise/registrations#new'
  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  patch 'user/editprofile.:id' => 'user#update'
  put 'ip/licensing.:id' => 'contract#new'
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  # Example of named route that can be invoked with purchase_url(id: product.id)
  # get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  resources :uploads, only: [:index, :new, :create, :destroy]
  resources :ip
  resources :stakeholder
  resources :contract
  resources :contract_detail


  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
