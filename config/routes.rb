Diplom::Application.routes.draw do

  get "student_groups/index"

  get "student_groups/show"

  get "students/index"

  get "students/show"

  get "documents/show"

  mount Ckeditor::Engine => '/ckeditor'

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

  root :to => 'home#index'

  resources :courses, :only => [:index, :show] do
    resources :lessons, :only => [:index, :show] do
      resources :testings do
        member do
          get :next
          get :results
        end
      end
      member do
        get :videos
        get :documents
        get :tests
      end
    end
  end

  resources :documents, only: :show

  resources :teachers do
    resources :students, :student_groups, :courses
  end

  resources :user_courses do
    collection do 
      post :bulk
    end
  end

  resources :categories, :study_rooms

  match 'search' => 'courses#search', :as => :search

  

  resources :statistics do
    member do
      get :courses
      get :testings
      get :questions
    end
    collection do
      get :passed
      get :failed
      get :new_courses
    end
  end

  resources :videos do
    member do
      post :add_comment
    end     
    new do
       post :upload
       get  :save_video
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
