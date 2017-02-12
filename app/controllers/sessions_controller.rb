class SessionsController < ApplicationController
  def create

    puts(request.env['omniauth.auth'].inspect)

    # begin
    #   user = User.from_omniauth(request.env['omniauth.auth'])
    #
    #   @user = user
    #   if @user != nil
    #     puts 'success'
    #     session[:user_id] = @user.id
    #
    #     flash[:success] = "Welcome #{@user.name}"
    #   else
    #     puts 'invalid email'
    #     flash[:warning] = 'You must use a WPS email address'
    #   end
    # rescue
    #   puts 'error'
    #   flash[:warning] = 'Error trying to authenticate you'
    # end
    #

    redirect_to root_path
  end

  def destroy
    if current_user
      session.delete(:user_id)
      flash[:success] = 'Bye'
    end
    redirect_to root_path
  end

  def auth_failure
    redirect_to root_path
  end
end