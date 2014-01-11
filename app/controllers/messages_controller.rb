class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.where("sender_id = #{current_user.id}  or recipient_id = #{current_user.id}")
    @message = Message.new
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create

    @message = Message.new(message_params)
    @message.sender_id = current_user.id
    @message.status = 'new'
    @converse = Conversation.find_by(first_owner_id: @message.sender_id , second_owner_id: @message.recipient_id)
    @converse = Conversation.find_by(first_owner_id: @message.recipient_id , second_owner_id: @message.sender_id) if @converse.nil?
    @conversation = Conversation.new(account_id: current_user.account_id, first_owner_id: @message.sender_id, second_owner_id: @message.recipient_id) if @converse.nil?
    @conversation.save if @converse.nil?
    @message.conversation_id = @conversation.id if @converse.nil? else @message.conversation_id = @converse.id

    respond_to do |format|
      if @message.save
        format.html { redirect_to account_messages_path, notice: 'Message was successfully created.' }
        format.js
      else
        format.html { render action: 'new' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:sender_id, :recipient_id, :title, :message, :status, :conversation_id)
    end
end
