class SessionsController < ApplicationController

    def new; end

    def create
        user = User.find_by(username: params[:username])
        
        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            flash.now[:notice] = 'Logged in'
        else
            flash.now[:alert] = 'Invalid username or password'
            render :new
        end
    end

    def destroy
        session[:user_id] = nil
    end
end
