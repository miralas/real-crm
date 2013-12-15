class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_special_params, only: [:show]
  before_action :authorize

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.where(account_id: current_user.account_id)
    respond_to do |format|
      format.html { 
        @tasks = Task.where(account_id: current_user.account_id)
      }
      format.json  {
        @tasks = Task.where(account_id: current_user.account_id)
        render json:  @tasks
      }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @task.account_id = current_user.account_id

    respond_to do |format|
      if @task.save
        format.html { redirect_to account_tasks_path(current_user.account_id), notice: 'Task was successfully created.' }
        format.json { render action: 'show', status: :created, location: @task }
      else
        format.html { render action: 'new' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to account_tasks_path(current_user.account_id), notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { render nothing: true }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    def set_special_params
      @owner = User.find_by(id: @task.responsible)
      @contact = Contact.find_by(id: @task.contact_id)
      @company = Company.find_by(id: @task.company_id)
      @deal = Deal.find_by(id: @task.deal_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:title, :type_of_task, :description, :date, :responsible, :account_id, :contact_id, :company_id, :deal_id)
    end
end
