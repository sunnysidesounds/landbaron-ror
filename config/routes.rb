LandBaron::Application.routes.draw do
  # map.resource :investments

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => 'authentication#sign_in'

  # Deal Room
  match '/preorder'               => 'preorder#index', :via => [:get,:post]
  get 'preorder/checkout'
  match '/preorder/share/:uuid'   => 'preorder#share', :via => :get
  match '/preorder/ipn'           => 'preorder#ipn', :via => :post
  match '/preorder/prefill'       => 'preorder#prefill', :via => [:get,:post]
  match '/preorder/postfill'      => 'preorder#postfill', :via => [:get,:post]

  # Authentication
  get 'sign_in' => 'authentication#sign_in'
  post 'sign_in' => 'authentication#login'
  get 'signed_out' => 'authentication#signed_out'
  get 'change_password' => 'authentication#change_password'
  get 'forgot_password' => 'authentication#forgot_password'
  get 'new_user' => 'authentication#new_user'
  post 'new_user' => 'authentication#register'
  get 'password_sent' => 'authentication#password_sent'

  # My Account
  get 'account' => 'my_account#account'
  #Landing Page
  get 'investments' => 'investment#investment'
  match 'investment_detail/:id'   => 'investment#investment_detail', :via => :get
  match 'invest/:id'   => 'investment#investment_now', :via => :get

  # quote
  post 'quote' => 'quote#create_quote'
  # confirmation
  match 'confirmation'   => 'investment#investment_confirmation', :via => :get



end



