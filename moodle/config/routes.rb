Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'static_pages#home'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'user/:user_id' => 'static_pages#courses'
  get 'user/:user_id/:assign_id' => 'static_pages#assignments'
  get 'user/:user_id/:assign_id/:subm_id' => 'static_pages#submissions'


end
