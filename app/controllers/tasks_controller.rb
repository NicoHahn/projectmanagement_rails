class TasksController < ApplicationController

  before_action :set_task, except: [:new, :create]

  def new
    @task = Task.new
    @project = Project.find_by(id: params[:project_id])
    @company = Company.find_by(id: params[:company_id])
    @users = get_possible_assignees
  end

  def create
    @task = Task.create(params.require(:task).permit(:name, :description, :project_id, :user_id, :creator_id))
    if @task
      redirect_to company_project_path(company_id: params[:company_id], id: params[:project_id])
    end
  end

  def update
    params[:user_id] = current_user.id
    if @task.update(params.require(:task).permit(:name, :description, :user_id))
      redirect_to company_project_path(company_id: params[:company_id], id: params[:project_id])
    end
  end

  def delete
  end

  def show
  end

  def edit
    @users = get_possible_assignees
  end

  def move
    @task.update(status: params[:new_status]) if @task
  end

  private

  def set_task
    @task = Task.find_by(id: params[:id])
    @project = Project.find_by(id: params[:project_id])
    @company = Company.find_by(id: params[:company_id])
  end

  def get_possible_assignees
    companies_user_ids = @company.user_ids
    User.where(id: companies_user_ids)
  end

end
