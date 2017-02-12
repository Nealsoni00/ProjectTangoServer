class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def page_not_found
    e = Error.new(:status => 404, :message => 'Invalid request. \'Pac down!')
    render :json => e.to_json, :status => 404
  end

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  helper_method :current_user
end
