Rails.application.routes.draw do
  resources :scan_images
  resources :scenarios
  root 'users#index'
  # resources :users
  # devise_for :users, path_names: {
  #   sign_in: 'login', sign_out: 'logout',
  #   password: 'secret', confirmation: 'verification',
  #   registration: 'register', edit: 'edit/profile'
  # }
  # devise_for :users
  devise_for :users
  #  views: { sessions: "users/sessions", shared: "users/shared", confirmations: "users/confirmations",
  #                                   unlocks: "users/unlocks", mailer: "users/mailer", passwords: "users/passwords", 
  #                                   registrations: "users/registrations"}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
