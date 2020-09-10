Rails.application.routes.draw do
  resources :topics
  resources :scan_images
  resources :scenarios do
    resources :reactions
    resource :comments, module: :scenarios
  end
  root 'users#index'

  scope module: :api, defaults: { format: :json }, path: 'api' do
    scope module: :v1,  path: 'api' do
      devise_scope :users do
        get    '/sign_in'   => 'api/v1/users/sessions#new',     as: :new_user_api_session_api
        post   '/sign_in'   => 'api/v1/users/sessions#create',  as: :user_session_api
        delete '/sign_out'  => 'api/v1/users/sessions#destroy', as: :destroy_user_session_api
        put    '/account',  to: 'api/v1/users/registrations#update'
        delete '/account',  to: 'api/v1/users/registrations#destroy'
        post   '/account',  to: 'api/v1/users/registrations#create'
        get    '/register', to: 'api/v1/users/registrations#new'
        get    '/account',  to: 'api/v1/users/registrations#edit'
        patch  '/account',  to: 'api/v1/users/registrations#update'
        get    '/account/cancel', to: 'api/v1/users/registrations#cancel'
      end
      #devise_for :users, controllers: {
      #    registrations: 'api/v1/users/registrations',
      #    sessions: 'api/v1/users/sessions'
      #}, skip: [:password]
    end
  end
  # resources :users
  # devise_for :users, path_names: {
  #   sign_in: 'login', sign_out: 'logout',
  #   password: 'secret', confirmation: 'verification',
  #   registration: 'register', edit: 'edit/profile'
  # }
  # devise_for :users
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth', sessions: "users/sessions" }
    #views: { sessions: "users/sessions", shared: "users/shared", confirmations: "users/confirmations",
    #                                 unlocks: "users/unlocks", mailer: "users/mailer", passwords: "users/passwords",
    #                                 registrations: "users/registrations"}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
