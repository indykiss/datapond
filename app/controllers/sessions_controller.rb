
class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        if auth
            @user = User.find_by(uid: auth["uid"])
            if @user 
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else 
                oauth_email = request.env["omniauth.auth"]["info"]["email"]
                oauth_username = request.env["omniauth.auth"]['info']['name']
                oauth_uid = request.env["omniauth.auth"]["uid"]
                oauth_provider = request.env["omniauth.auth"]["provider"]
                @user = User.new(
                    :email => oauth_email, 
                    :password_digest => 'meep123meep', 
                    :username => oauth_username,
                    :uid => oauth_uid,
                    :provider => oauth_provider
                    )
                if @user.save
                    session[:user_id] = @user.id
                    redirect_to data_packages_path
                end
            end
        else 
            @user = User.find_by(email: params[:email])
            if @user 
                session[:user_id] = @user.id
                redirect_to data_packages_path
            else
            redirect_to signin_path
            end
        end
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end

    def auth
        request.env['omniauth.auth']
      end


end