class MainController < ApplicationController
  before_action :authorize
  
  def index
    fresh_when [File.mtime('app/views/main/index.html.erb'), current_user], public: true
  end
end
