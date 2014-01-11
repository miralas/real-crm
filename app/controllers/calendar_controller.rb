class CalendarController < ApplicationController
  before_action :authorize
  def index
    @account_path = account_path(current_user.account)
  end
end
