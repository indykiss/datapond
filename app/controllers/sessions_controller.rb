
class SessionsController < ApplicationController


    def new
        @user = User.new
    end

    def create
        @user = User.find_by(email: params[:email])
        if @user 
            #&& @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to data_packages_index_path 
        else
            redirect_to signin_path
        end
    end
    
    def create_from_omniauth
        @user = User.find_or_create_by(id: auth['id']) do |u|
            u.username = auth['info']['username']
            u.email = auth['info']['email']
        end
        session[:user_id] = @user.id
        render 'sessions/home'
    end

    def destroy
        session.clear
        redirect_to root_path
    end

    private
 
    def auth
      request.env['omniauth.auth']
    end

end