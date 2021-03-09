class ProjectsController < ApplicationController

  before_action :set_project, except: [:new, :create]

  def new
    @project = Project.new
    @company = Company.find_by(id: params[:company_id])
  end

  def create
    @project = Project.create(params.require(:project).permit(:name, :description, :company_id, :creator_id))
    if @project
      redirect_to company_project_path(company_id: params[:company_id], id: @project.id)
    end
  end

  def update
  end

  def delete
  end

  def show
  end

  private
  def set_project
    @project = Project.find_by(id: params[:id])
  end

end
