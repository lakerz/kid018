Yesbaobei::Application.routes.draw do

  resources :user_articles

  match "provinces/display_all" => "provinces#display_all"

  resources :provinces do
    member do
      get 'show_cities_of_province'
    end
  end

  resources :cities

  resources :provinces

  resources :invitecodes

  resources :users do
    collection do
      get 'check_mail'
      get 'check_name'
      get 'check_invitecode'
      get 'user_confirmation'
      get 'login'
      get 'logout'
      post 'login_check'
    end
  end

  resources :users do
    member do
      get 'send_confirmation_mail'
      get 'main_page'
    end
  end

  resources :users

  resources :article_comment_replies

  resources :article_comments

  get "main/index"
  get "main/login"

  get 'kindeditor/images_list'

  post 'kindeditor/upload'

  resources :articles

  resources :boards

  root :to=> 'main#index', :as => 'main'

  #add a route which match "articles/id/add_comment"
  resources :articles do
    member do
      post 'add_comment'
      get 'recommand'
      get 'add_favorite'
    end
  end

  #add a route which match "article_comments/id/light"
  resources :article_comments do
    member do
      get 'light'
    end
  end





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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
