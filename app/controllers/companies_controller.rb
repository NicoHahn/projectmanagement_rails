class CompaniesController < ApplicationController

  before_action :set_company_and_projects, except: [:new, :create]

  def index
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.create(params.require(:company).permit(:name, :creator_id))
    if @company
      redirect_to company_path(id: @company.id)
    end
  end

  def update
  end

  def show
    @users = User.all.where.not(id: @company.user_ids).where.not(id: @company.creator_id)
  end

  def delete

  end

  def add_user
    # TODO:
    # create corresponding notification
    # create some type of membership level
    if User.find_by(id: params[:company][:user_ids].to_i)
      @company.user_ids = @company.user_ids << params[:company][:user_ids].to_i
      @company.save!
    end
    redirect_to company_path(id: @company.id)
  end

  private
  def set_company_and_projects
    @company = Company.find_by(id: params[:id])
    @company_projects = Project.where(company_id: @company.id) if @company
  end

end
