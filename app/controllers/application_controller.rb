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
        user_path # Temporary Path
      else
        root_path             
      end
    end
    
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end
