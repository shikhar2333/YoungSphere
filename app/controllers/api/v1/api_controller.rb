module Api
  module V1
    class ApiController < ActionController::API
      include ActionController::MimeResponds
      before_action :check_basic_auth
      protect_from_forgery unless: -> { request.format.json? }
      skip_before_action :verify_authenticity_token
      before_action :configure_permitted_parameters, if: :devise_controller?
      respond_to :json
      private

      def check_basic_auth
        unless request.authorization.present?
          head :unauthorized
          return
        end

        authenticate_with_http_basic do |email, password|
          user = User.find_by(email: email.downcase)

          if user && user.authenticate(password)
            @current_user = user
          else
            head :unauthorized
          end
        end
      end

      def current_user
        @current_user
      end
      protected

      # Devise methods
      # Authentication key(:username) and password field will be added automatically by devise.
      def configure_permitted_parameters
        added_attrs = [:email, :first_name, :last_name]
        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
        devise_parameter_sanitizer.permit :account_update, keys: added_attrs
      end
    end
  end
end