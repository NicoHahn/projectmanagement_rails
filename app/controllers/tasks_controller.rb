class TasksController < ApplicationController

  before_action :set_task, except: [:new, :create]

  def new
    @task = Task.new
    @project = Project.find_by(id: params[:project_id])
    @company = Company.find_by(id: params[:company_id])
    @users = User.all.where.not(id: @company.user_ids)
  end

  def create
    @task = Task.create(params.require(:task).permit(:name, :description, :project_id, :user_id, :creator_id))
    if @task
      redirect_to company_project_path(company_id: params[:company_id], id: params[:project_id])
    end
  end

  def update
  end

  def delete
  end

  def show
  end

  def move
    @task.update(status: params[:new_status]) if @task
  end

  private
  def set_task
    @task = Task.find_by(id: params[:id])
  end

end
