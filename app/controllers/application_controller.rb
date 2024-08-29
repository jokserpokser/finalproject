class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        case resource.user_type
        when 'admin'
          admin_dashboard_path
        when 'buyer'
          admin_dashboard_path # Temporary Path
        else
          root_path             
        end
      end
    
    def after_sign_out_path_for(resource_or_scope)
        new_user_session_path
    end
end
