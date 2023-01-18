class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    def after_sign_in_for (resources)
        home_index_url
    end
    def after_sign_out_for (resources)
        home_index_url
    end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone])
    end
end
