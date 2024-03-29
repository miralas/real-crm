require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  setup do
    @task = tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post :create, task: { account_id: @task.account_id, company_id: @task.company_id, contact_id: @task.contact_id, date: @task.date, deal_id: @task.deal_id, description: @task.description, responsible: @task.responsible, title: @task.title, type: @task.type }
    end

    assert_redirected_to task_path(assigns(:task))
  end

  test "should show task" do
    get :show, id: @task
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @task
    assert_response :success
  end

  test "should update task" do
    patch :update, id: @task, task: { account_id: @task.account_id, company_id: @task.company_id, contact_id: @task.contact_id, date: @task.date, deal_id: @task.deal_id, description: @task.description, responsible: @task.responsible, title: @task.title, type: @task.type }
    assert_redirected_to task_path(assigns(:task))
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete :destroy, id: @task
    end

    assert_redirected_to tasks_path
  end
end
