  Rails.application.routes.draw do
  devise_for :user, :controllers => { registrations: 'registrations'}
  root 'user#home'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get 'user/editprofile' => 'user#edit'
  get 'user/profile' => 'user#profile'

  get 'ip/myIps' => 'ip#my_ips'
  put 'ip/info/:id' => 'ip#ip_info', :as => :ip_info
  post 'ip/show' => 'ip#show'

  get 'ip/licensing' => 'ip#license'
  put 'contract/new/:id' => 'contract#new', :as => :new_contract
  put 'contract/new/:id' => 'contract#create', :as => :contract_create
  post 'contract/new/:id' => 'contract#create'
  get 'contract/new/:id' => 'contract#new'

  get 'about' => 'user#about'
  get 'user/earnings' => 'user#earnings'
  get 'ip/upload_ip' => 'uploads#new'
  post 'ip/upload_ip' => 'uploads#create'
  get 'ip/new_stakeholder/:id' => 'stakeholder#new', :as => :stakeholder_new
  post 'ip/new_stakeholder/:id' => 'stakeholder#create', :as => :stakeholder_create
  #put 'ip/new_stakeholder/:id' => 'stakeholder#create', :as => :stakeholder_create
  post '/stakeholder/:id' => 'stakeholder#show'


  get 'admin' => 'admin#home'
  get 'admin/about' => 'admin#about'
  get 'admin/earnings' => 'admin#earnings'
  get 'admin/viewall' => 'admin#viewall'
  get 'user/afteredit' => 'user#afteredit'
  match '/admin/:id' => 'admin#user_destroy', :via => :delete, :as => :admin_user_destroy
  get 'admin/createuser' => 'admin#createuser'
  post 'admin/createuser' => 'admin#create'
  get 'admin/profile' => 'admin#profile'
  put '/admin/aticm/:id' => 'admin#add_temp_ipc_member', :as => :admin_add_temp_ipc_member
  put '/admin/apicm/:id' => 'admin#add_permanent_ipc_member', :as => :admin_add_permanent_ipc_member
  put '/admin/rim/:id' => 'admin#remove_ipc_member', :as => :admin_remove_ipc_member
  #get 'admin/createuser' => 'devise/registrations#new'
  # You can have the root of your site routed with "root"
  # root 'welcome#index'


  patch 'user/editprofile.:id' => 'user#update'
  put 'ip/licensing.:id' => 'contract#new'
  get 'user/pending' => 'ip_committee#pending'
  put 'ip_committee/approvals/:id' => 'ip_committee#approvals', :as => :ip_committee_approvals
  put 'ip_committee/approve_this_ip/:id' => 'ip_committee#update', :as => :ip_committee_update
  put 'ip_committee/disapprove_this_ip/:id' => 'ip_committee#disapprove', :as => :ip_committee_disapprove
  get 'ip_committee/approvals/:id' => 'ip_committee#approvals'
  put 'ip/new_stakeholder/assignipcm/:id'=> 'ip_committee#upload_ipcm_check', :as => :ip_committee_upload_ipcm_check
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
