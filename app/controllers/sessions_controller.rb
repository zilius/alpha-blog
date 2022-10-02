class SessionsController < ApplicationController

    def new
    end

    def create
        if session[:user_id]
            flash[:notice] = "Alredy logged in"
        end

        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:notice] = "Logged in succesfully"
            redirect_to user
        else
            flash.now[:alert] = "Invalid credentials"
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "Logged out"
        redirect_to root_path
    end

end