LandBaron::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => 'preorder#index'
  match '/preorder'               => 'preorder#index', :via => [:get,:post]
  get 'preorder/checkout'
  match '/preorder/share/:uuid'   => 'preorder#share', :via => :get
  match '/preorder/ipn'           => 'preorder#ipn', :via => :post
  match '/preorder/prefill'       => 'preorder#prefill', :via => [:get,:post]
  match '/preorder/postfill'      => 'preorder#postfill', :via => [:get,:post]

  # Temp switch to this root
 # root :to=>"home#index"

  # Authentication
  get "sign_in" => "authentication#sign_in"
  post "sign_in" => "authentication#login"
  get "signed_out" => "authentication#signed_out"
  get "change_password" => "authentication#change_password"
  get "forgot_password" => "authentication#forgot_password"


  #match 'new_user'      => 'authentication#new_user', :via => [:get,:post]


  get "new_user" => "authentication#new_user"
  post "new_user" => "authentication#register"


  get "password_sent" => "authentication#password_sent"


end
