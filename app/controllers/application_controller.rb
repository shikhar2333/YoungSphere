class ApplicationController < ActionController::Base
	before_action :set_raven_context

  def set_raven_context
    if user_signed_in?
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

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) do |user_params|
        user_params.permit({ roles: [] }, :name, :email, :password, :password_confirmation, :avatar)
        end
        devise_parameter_sanitizer.permit(:account_update) do |user_params|
            user_params.permit({ roles: [] }, :name, :email, :password, :password_confirmation, :avatar)
        end
    end
end


