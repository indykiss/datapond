
class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    def current_user
        if session[:current_user_id]
            user = User.find_by(id: session[:current_user_id])
          end
    end

    def logged_in?
        !!current_user
    end



end
