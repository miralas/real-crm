class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action :set_special_params, only: [:show]
  after_action :history_note, only: [:create, :edit, :destroy]
  before_action :authorize
  
  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.where(account_id: current_user.account_id)
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
   
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)
    @contact.account_id = current_user.account_id

    respond_to do |format|
      if @contact.save
        format.html { redirect_to account_contact_path(current_user.account_id, @contact), notice: 'Contact was successfully created.' }
        format.json { render action: 'show', status: :created, location: @contact }
      else
        format.html { render action: 'new' }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to account_contacts_path(current_user.account_id), notice: 'Contact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { render nothing: true }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def set_special_params
      @owner   = User.find_by(id: @contact.responsible)
      @company = Company.find_by(id: @contact.company_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:name, :phone, :email, :skype, :post, :responsible, :account_id, :company_id, :notes)
    end
    
    def history_note
      note = History.create(user_id: current_user.id, account_id: params[:account_id], action: "#{params[:action]} #{params[:controller]}", obj_name: "#{@contact.name}", obj_link: account_deal_path(current_user.account_id, @contact.id))
      note.save
    end
end
