class CalendarController < ApplicationController
  def index
    @account_path = account_path(current_user.account)
  end
end
