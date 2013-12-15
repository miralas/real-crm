class UserController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  after_action :history_note, only: [:create, :edit, :destroy]
  skip_before_action :authorize, only: [:new, :create]

  # GET /users
  def index
    @users = User.where(account_id: current_user.account_id)
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find_by(id: params[:id])
  end

  # POST /users
  def create
    @user = User.new(user_params)
    @user.account_id = current_user.account_id

    respond_to do |format|
      if @user.save
        format.html {
          redirect_to [current_user.account, @user], notice: 'User was successfully created.' 
        }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /users/1
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to account_user_url, notice: 'User was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { render nothing: true }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:account_id, :email, :password,:password_confirmation, :name, :surname, :mobile_phone, :work_phone, :notes)
    end
    
    def create_session_for user
      session[:user_id] = user.id
    end
    
    def history_note
      note = History.create(user_id: current_user.id, account_id: params[:account_id], action: "#{params[:action]} #{params[:controller]}", obj_name: " #{@user.name}", obj_link: account_deal_path(current_user.account_id, @user.id))
      note.save
    end
end
