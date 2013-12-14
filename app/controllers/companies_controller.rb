class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  before_action :set_special_params, only: [:show]
  before_action :authorize

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.where(account_id: current_user.account_id)
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    @owner   = User.find_by(id: @company.responsible)
    @contact = Contact.find_by(id: @company.contact_id)
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)
    @company.account_id = current_user.account_id

    respond_to do |format|
      if @company.save
        format.html { redirect_to account_company_path(current_user.account_id, @company), notice: 'Company was successfully created.' }
        format.json { render action: 'show', status: :created, location: @company }
      else
        format.html { render action: 'new' }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to account_companies_path(current_user.account_id), notice: 'Company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { render nothing: true }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    def set_special_params
      @owner   = User.find_by(id: @company.responsible)
      @contact = Contact.find_by(id: @company.contact_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :phone, :email, :site, :adress, :responsible, :account_id, :contact_id, :notes)
    end
end
