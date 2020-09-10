# == Route Map
#
#                                Prefix Verb     URI Pattern                                                                              Controller#Action
#                                topics GET      /topics(.:format)                                                                        topics#index
#                                       POST     /topics(.:format)                                                                        topics#create
#                             new_topic GET      /topics/new(.:format)                                                                    topics#new
#                            edit_topic GET      /topics/:id/edit(.:format)                                                               topics#edit
#                                 topic GET      /topics/:id(.:format)                                                                    topics#show
#                                       PATCH    /topics/:id(.:format)                                                                    topics#update
#                                       PUT      /topics/:id(.:format)                                                                    topics#update
#                                       DELETE   /topics/:id(.:format)                                                                    topics#destroy
#                           scan_images GET      /scan_images(.:format)                                                                   scan_images#index
#                                       POST     /scan_images(.:format)                                                                   scan_images#create
#                        new_scan_image GET      /scan_images/new(.:format)                                                               scan_images#new
#                       edit_scan_image GET      /scan_images/:id/edit(.:format)                                                          scan_images#edit
#                            scan_image GET      /scan_images/:id(.:format)                                                               scan_images#show
#                                       PATCH    /scan_images/:id(.:format)                                                               scan_images#update
#                                       PUT      /scan_images/:id(.:format)                                                               scan_images#update
#                                       DELETE   /scan_images/:id(.:format)                                                               scan_images#destroy
#                    scenario_reactions GET      /scenarios/:scenario_id/reactions(.:format)                                              reactions#index
#                                       POST     /scenarios/:scenario_id/reactions(.:format)                                              reactions#create
#                 new_scenario_reaction GET      /scenarios/:scenario_id/reactions/new(.:format)                                          reactions#new
#                edit_scenario_reaction GET      /scenarios/:scenario_id/reactions/:id/edit(.:format)                                     reactions#edit
#                     scenario_reaction GET      /scenarios/:scenario_id/reactions/:id(.:format)                                          reactions#show
#                                       PATCH    /scenarios/:scenario_id/reactions/:id(.:format)                                          reactions#update
#                                       PUT      /scenarios/:scenario_id/reactions/:id(.:format)                                          reactions#update
#                                       DELETE   /scenarios/:scenario_id/reactions/:id(.:format)                                          reactions#destroy
#                 new_scenario_comments GET      /scenarios/:scenario_id/comments/new(.:format)                                           scenarios/comments#new
#                edit_scenario_comments GET      /scenarios/:scenario_id/comments/edit(.:format)                                          scenarios/comments#edit
#                     scenario_comments GET      /scenarios/:scenario_id/comments(.:format)                                               scenarios/comments#show
#                                       PATCH    /scenarios/:scenario_id/comments(.:format)                                               scenarios/comments#update
#                                       PUT      /scenarios/:scenario_id/comments(.:format)                                               scenarios/comments#update
#                                       DELETE   /scenarios/:scenario_id/comments(.:format)                                               scenarios/comments#destroy
#                                       POST     /scenarios/:scenario_id/comments(.:format)                                               scenarios/comments#create
#                             scenarios GET      /scenarios(.:format)                                                                     scenarios#index
#                                       POST     /scenarios(.:format)                                                                     scenarios#create
#                          new_scenario GET      /scenarios/new(.:format)                                                                 scenarios#new
#                         edit_scenario GET      /scenarios/:id/edit(.:format)                                                            scenarios#edit
#                              scenario GET      /scenarios/:id(.:format)                                                                 scenarios#show
#                                       PATCH    /scenarios/:id(.:format)                                                                 scenarios#update
#                                       PUT      /scenarios/:id(.:format)                                                                 scenarios#update
#                                       DELETE   /scenarios/:id(.:format)                                                                 scenarios#destroy
#                                  root GET      /                                                                                        users#index
#              new_user_api_session_api GET      /api/v1/sign_in(.:format)                                                                api/v1/api/v1/users/sessions#new {:format=>:json}
#                      user_session_api POST     /api/v1/sign_in(.:format)                                                                api/v1/api/v1/users/sessions#create {:format=>:json}
#              destroy_user_session_api DELETE   /api/v1/sign_out(.:format)                                                               api/v1/api/v1/users/sessions#destroy {:format=>:json}
#                               account PUT      /api/v1/account(.:format)                                                                api/v1/api/v1/users/registrations#update {:format=>:json}
#                                       DELETE   /api/v1/account(.:format)                                                                api/v1/api/v1/users/registrations#destroy {:format=>:json}
#                                       POST     /api/v1/account(.:format)                                                                api/v1/api/v1/users/registrations#create {:format=>:json}
#                              register GET      /api/v1/register(.:format)                                                               api/v1/api/v1/users/registrations#new {:format=>:json}
#                                       GET      /api/v1/account(.:format)                                                                api/v1/api/v1/users/registrations#edit {:format=>:json}
#                                       PATCH    /api/v1/account(.:format)                                                                api/v1/api/v1/users/registrations#update {:format=>:json}
#                        account_cancel GET      /api/v1/account/cancel(.:format)                                                         api/v1/api/v1/users/registrations#cancel {:format=>:json}
#                      new_user_session GET      /users/sign_in(.:format)                                                                 users/sessions#new
#                          user_session POST     /users/sign_in(.:format)                                                                 users/sessions#create
#                  destroy_user_session DELETE   /users/sign_out(.:format)                                                                users/sessions#destroy
#      user_facebook_omniauth_authorize GET|POST /users/auth/facebook(.:format)                                                           users/omniauth#passthru
#       user_facebook_omniauth_callback GET|POST /users/auth/facebook/callback(.:format)                                                  users/omniauth#facebook
#        user_github_omniauth_authorize GET|POST /users/auth/github(.:format)                                                             users/omniauth#passthru
#         user_github_omniauth_callback GET|POST /users/auth/github/callback(.:format)                                                    users/omniauth#github
# user_google_oauth2_omniauth_authorize GET|POST /users/auth/google_oauth2(.:format)                                                      users/omniauth#passthru
#  user_google_oauth2_omniauth_callback GET|POST /users/auth/google_oauth2/callback(.:format)                                             users/omniauth#google_oauth2
#       user_twitter_omniauth_authorize GET|POST /users/auth/twitter(.:format)                                                            users/omniauth#passthru
#        user_twitter_omniauth_callback GET|POST /users/auth/twitter/callback(.:format)                                                   users/omniauth#twitter
#                     new_user_password GET      /users/password/new(.:format)                                                            devise/passwords#new
#                    edit_user_password GET      /users/password/edit(.:format)                                                           devise/passwords#edit
#                         user_password PATCH    /users/password(.:format)                                                                devise/passwords#update
#                                       PUT      /users/password(.:format)                                                                devise/passwords#update
#                                       POST     /users/password(.:format)                                                                devise/passwords#create
#              cancel_user_registration GET      /users/cancel(.:format)                                                                  devise/registrations#cancel
#                 new_user_registration GET      /users/sign_up(.:format)                                                                 devise/registrations#new
#                edit_user_registration GET      /users/edit(.:format)                                                                    devise/registrations#edit
#                     user_registration PATCH    /users(.:format)                                                                         devise/registrations#update
#                                       PUT      /users(.:format)                                                                         devise/registrations#update
#                                       DELETE   /users(.:format)                                                                         devise/registrations#destroy
#                                       POST     /users(.:format)                                                                         devise/registrations#create
#                 new_user_confirmation GET      /users/confirmation/new(.:format)                                                        devise/confirmations#new
#                     user_confirmation GET      /users/confirmation(.:format)                                                            devise/confirmations#show
#                                       POST     /users/confirmation(.:format)                                                            devise/confirmations#create
#                       new_user_unlock GET      /users/unlock/new(.:format)                                                              devise/unlocks#new
#                           user_unlock GET      /users/unlock(.:format)                                                                  devise/unlocks#show
#                                       POST     /users/unlock(.:format)                                                                  devise/unlocks#create
#         rails_postmark_inbound_emails POST     /rails/action_mailbox/postmark/inbound_emails(.:format)                                  action_mailbox/ingresses/postmark/inbound_emails#create
#            rails_relay_inbound_emails POST     /rails/action_mailbox/relay/inbound_emails(.:format)                                     action_mailbox/ingresses/relay/inbound_emails#create
#         rails_sendgrid_inbound_emails POST     /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                  action_mailbox/ingresses/sendgrid/inbound_emails#create
#   rails_mandrill_inbound_health_check GET      /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#health_check
#         rails_mandrill_inbound_emails POST     /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#create
#          rails_mailgun_inbound_emails POST     /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                              action_mailbox/ingresses/mailgun/inbound_emails#create
#        rails_conductor_inbound_emails GET      /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#index
#                                       POST     /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#create
#     new_rails_conductor_inbound_email GET      /rails/conductor/action_mailbox/inbound_emails/new(.:format)                             rails/conductor/action_mailbox/inbound_emails#new
#    edit_rails_conductor_inbound_email GET      /rails/conductor/action_mailbox/inbound_emails/:id/edit(.:format)                        rails/conductor/action_mailbox/inbound_emails#edit
#         rails_conductor_inbound_email GET      /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#show
#                                       PATCH    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       PUT      /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       DELETE   /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#destroy
# rails_conductor_inbound_email_reroute POST     /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                      rails/conductor/action_mailbox/reroutes#create
#                    rails_service_blob GET      /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#             rails_blob_representation GET      /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#                    rails_disk_service GET      /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#             update_rails_disk_service PUT      /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#                  rails_direct_uploads POST     /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  resources :topics
  resources :scan_images
  resources :scenarios do
    resources :reactions
    resource :comments, module: :scenarios
  end
  root 'users#index'

  scope module: :api, defaults: { format: :json }, path: 'api' do
    scope module: :v1,  path: 'v1' do
      devise_scope :user do
        get    '/sign_in'   => 'users/sessions#new',     as: :new_user_api_session_api
        post   '/sign_in'   => 'users/sessions#create',  as: :user_session_api
        delete '/sign_out'  => 'users/sessions#destroy', as: :destroy_user_session_api
        put    '/account',  to: 'users/registrations#update'
        delete '/account',  to: 'users/registrations#destroy'
        post   '/account',  to: 'users/registrations#create'
        get    '/register', to: 'registrations#new'
        get    '/account',  to: 'registrations#edit'
        patch  '/account',  to: 'registrations#update'
        get    '/account/cancel', to: 'registrations#cancel'
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
