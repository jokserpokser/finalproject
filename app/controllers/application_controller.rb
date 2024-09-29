class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :contact_number, :address])
  end

  def after_sign_in_path_for(resource)
    case resource.user_type
      when 'admin'
        admin_dashboard_path
      when 'buyer'
        user_path
      else
        root_path             
      end
    end
    
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  def authenticate_admin!
    redirect_to root_path, alert: "You are not authorized to access this page." unless current_user&.user_type == 'admin'
  end
end
