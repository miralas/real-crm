module ApplicationHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def find_new_messages
    @new_messages = Message.where(recipient_id: current_user.id, status: 'new').count
  end
end
