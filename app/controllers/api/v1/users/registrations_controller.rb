class Api::V1::Users::RegistrationsController < Devise::RegistrationsController
    # POST /resource
    skip_before_action :verify_authenticity_token
    def create
      build_resource(sign_up_params)
      resource.save
      if resource.persisted?
        if resource.active_for_authentication?
          render json: resource # , location: after_sign_up_path_for(resource)
        else
          expire_data_after_sign_in!
          render json: resource # , location: after_inactive_sign_up_path_for(resource)
        end
      else
        clean_up_passwords resource
        set_minimum_password_length
        render json: resource.errors.full_messages
      end
    end
end