Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post "sign-up", to: "users#create"
  post '/login', to: 'user_tokens#create'
  get '/logout', to: 'user_tokens#destroy'
  # get '/:resource/:route', to: 'pages#authorize_request'
  # post '/:resource/:route', to: 'pages#authorize_request'
  match '/:resource/:route' => 'pages#authorize_request', via: [:get, :post, :put, :patch, :delete]

end
