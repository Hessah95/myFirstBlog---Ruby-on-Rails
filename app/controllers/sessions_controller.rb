class SessionsController < ApplicationController
    # This controller provides login functionality to an existing user & logs out a user by deleting session data

    def new; end

    def create
        user = User.find_by(email: params[:email])

        # finds existing user, checks to see if user can be authenticated
        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path, notice: 'Logged in successfully'
        else
            flash.new[:alert] = 'Invalid email or password'
            render :new
        end
    end

    def destroy
        # delete user session to logout
        session[:iser_id] = nil
        redirect_to root_path, notice: 'Logged out'
    end

end