class ProjectsController < ApplicationController

  before_action :set_project, except: [:new, :create]

  def new
    @project = Project.new
    @company = Company.find_by(id: params[:company_id])
  end

  def create
    @project = Project.create(params.require(:project).permit(:name, :description, :company_id, :creator_id))
    redirect_to company_project_path(company_id: params[:company_id], id: @project.id) if @project
  end

  def update
  end

  def delete
  end

  def show
    @company_id = params[:company_id]
    @tasks = Task.where(project_id: @project.id)
  end

  private
  def set_project
    @project = Project.find_by(id: params[:id])
  end

end
