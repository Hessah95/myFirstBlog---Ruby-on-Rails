class PasswordsController  < ApplicationController

    # aloows only logged in users
    before_action :require_user_logged_in!
    # ^ this is a Rails callback this is defined in the application_controller.rb

    def edit; end

    def update
        # update user password
        if Current.user.update(password_params)
            redirect_to root_path, notice: 'Password Updated'
        else
            render :edit
        end
    end


    private
    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end

end