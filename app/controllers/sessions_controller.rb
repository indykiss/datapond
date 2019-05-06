
class SessionsController < ApplicationController

    def new
        @user = User.new
    end


    def create
        auth = request.env['omniauth.auth']
        # here we check for fb sign in   
        if auth
            @user = User.find_by(uid: auth["uid"])
            if @user 
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else 
                @user = User.create
                if @user.save
                    session[:user_id] = @user.id
                    redirect_to data_packages_path
                else 
                    flash[:message] = "FB auth didn't work, please try again."
                end
            end
        else 
            #then we check if they've logged in with our site before
            @user = User.find_by(email: params[:email])
            if @user && @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                redirect_to data_packages_path
            else
            flash[:message] = "Incorrect password or email is in use."
            redirect_to signin_path
            end
        end
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end



end