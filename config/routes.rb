Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  root 'courses#index'
  # get 'courses' => 'courses#index'
  # get 'courses/new' => 'courses#new', as: :course_new
  # get 'courses/:id' => 'courses#show', as: :course
  # post 'courses' => 'courses#create'

  # get 'courses/:course_id/assignments' => 'assignments#index'
  # get 'courses/:course_id/assignments/new' => 'assignments#new', as: :assignment_new
  # get 'courses/:course_id/assignments/:assign_id' => 'assignments#show', as: :assignment
  # post 'courses/:course_id/assignments/new' => 'assignments#create'

  # get 'courses/:course_id/assignments/:assign_id/submissions' => 'submissions#index'
  # get 'courses/:course_id/assignments/:assign_id/submissions/new' => 'submissions#new'
  # get 'courses/:course_id/assignments/:assign_id/submissions/:submissions_id' => 'submissions#show', as: :submissions
  # post 'courses/:course_id/assignments/:assign_id/submissions' => 'submissions#create'

  # get 'courses/:course_id/assignments/:assign_id/submissions/:submissions_id/new_comment' => 'comments#new'
  # post 'courses/:course_id/assignments/:assign_id/submissions/:submissions_id/' => 'comments#create'

  get 'signup' => 'users#new'
  resources :users

  resources :courses do
    member do
      get :edit_users
      post :update_users
    end
    resources :assignments do
      resources :submissions
    end
  end
  #resources :assignments
  #resources :submissions

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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
