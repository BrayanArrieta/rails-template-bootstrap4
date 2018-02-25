Rails.application.routes.draw do
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations:'users/registrations' 
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home' => 'home#index'
  #
  get 'email_link/new'
  post 'email_link/create'
  get 'email_link/validate'
  resources :users
  root 'home#index'
end
