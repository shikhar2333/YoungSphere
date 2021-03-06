module Api
  module V1
    class Users::SessionsController < Devise::SessionsController
      skip_before_action :verify_authenticity_token
      respond_to :json
      after_action -> { request.session_options[:skip] = true }
      # before_action :configure_sign_in_params, only: [:create]

      # GET /resource/sign_in
      # def new
      #   super
      # end

      # POST /resource/sign_in
      def create
        self.resource = warden.authenticate!(auth_options)
        set_flash_message!(:notice, :signed_in)
        sign_in(resource_name, resource)
        yield resource if block_given?
        #respond_with resource, location: after_sign_in_path_for(resource)
        respond_to do |format|
          puts resource
          if resource.present?
            format.json { render json: resource }
            format.html { redirect_to(after_sign_in_path_for(resource)) }
          else
            format.json { render json: resource }
            format.html { render action: "new" }
          end
        end
      end

      # DELETE /resource/sign_out
      # def destroy
      #   super
      # end
      private
      def respond_with(resource, _opts = {})
        render json: resource
      end
      def respond_to_on_destroy
        head :ok
      end
      # protected

      # If you have extra params to permit, append them to the sanitizer.
      # def configure_sign_in_params
      #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
      # end
    end
  end
end

