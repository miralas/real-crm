class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :authorize
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  protected
  
  def authorize
    if current_user
      unless current_user.can?(params[:controller], params[:action])
        redirect_to home_url, notice: 'You no have permissions to do this.'
      end
    else
      redirect_to login_path, notice: "Please log in"
    end
  end
  
  def set_public_proxy_refresh
    expires_now if stale? current_user.to_s
    expires_in 5.minutes, public: true
  end
  
  def mes
    @new_messages = Message.where(recipient_id: current_user.id, status: 'new').count
  end
end
