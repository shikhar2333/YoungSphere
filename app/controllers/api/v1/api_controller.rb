module Api
  module V1
    class ApiController < ActionController::API
      include ActionController::MimeResponds
      before_action :set_raven_context

      def set_raven_context
        if user_signed_in?
          adsfasd
          Raven.user_context(id: current_user.id, email: current_user.email, ip_address: request.ip)
        else
          Raven.user_context(id: session.id, ip_address: request.ip)
        end
        Raven.extra_context(params: params.to_unsafe_h, url: request.url, ip_address: request.ip)
      end

      def log_exception(request, params, exception)
        Raven.extra_context(url: request.url, params: params.to_unsafe_h)
        Raven.capture_exception(exception)
      end
      before_action :configure_permitted_parameters, if: :devise_controller?
      respond_to :json
      private

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