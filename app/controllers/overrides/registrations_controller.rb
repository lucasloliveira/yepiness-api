module Overrides
  class RegistrationsController < DeviseTokenAuth::ApplicationController
    before_filter :set_user_by_token, :only => [:destroy, :update]
    skip_after_filter :update_auth_header, :only => [:create, :destroy]

    def create
      # @resource            = resource_class.new(sign_up_params)
      @resource            = resource_class.where(email: params[:email], active: false).first_or_initialize
      @resource.update_attributes(sign_up_params)
      @resource.active = true
      @resource.provider   = "email"

      # honor devise configuration for case_insensitive_keys
      if resource_class.case_insensitive_keys.include?(:email)
        @resource.email = sign_up_params[:email].downcase
      else
        @resource.email = sign_up_params[:email]
      end

      # success redirect url is required
      if resource_class.devise_modules.include?(:confirmable) && !params[:confirm_success_url]
        return render json: {
            status: 'error',
            data:   @resource,
            errors: ["Missing `confirm_success_url` param."]
        }, status: 403
      end

      begin
        # override email confirmation, must be sent manually from ctrl
        resource_class.skip_callback("create", :after, :send_on_create_confirmation_instructions)
        if @resource.save

          # unless @resource.confirmed?
          #   # user will require email authentication
          #   @resource.send_confirmation_instructions({
          #                                                client_config: params[:config_name],
          #                                                redirect_url: params[:confirm_success_url]
          #                                            })
          #
          # else
            # email auth has been bypassed, authenticate user
            @client_id = SecureRandom.urlsafe_base64(nil, false)
            @token     = SecureRandom.urlsafe_base64(nil, false)

            @resource.tokens[@client_id] = {
                token: BCrypt::Password.create(@token),
                expiry: (Time.now + DeviseTokenAuth.token_lifespan).to_i
            }

            @resource.save!

            update_auth_header
          # end

          render json: {
              status: 'success',
              data:   @resource.as_json
          }
        else
          clean_up_passwords @resource
          render json: {
              status: 'error',
              data:   @resource,
              errors: @resource.errors.to_hash.merge(full_messages: @resource.errors.full_messages)
          }, status: 403
        end
      rescue ActiveRecord::RecordNotUnique
        clean_up_passwords @resource
        render json: {
            status: 'error',
            data:   @resource,
            errors: ["An account already exists for #{@resource.email}"]
        }, status: 403
      end
    end

    def sign_up_params
      params.permit(devise_parameter_sanitizer.for(:sign_up))
    end

    def account_update_params
      params.permit(devise_parameter_sanitizer.for(:account_update))
    end
  end
end