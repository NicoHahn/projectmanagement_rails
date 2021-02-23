class CompaniesController < ApplicationController

  before_action :set_company, except: [:new, :create]

  def new
    @company = Company.new
  end

  def create
    @company = Company.create(params.require(:company).permit(:name))
    if @company
      redirect_to company_path(id: @company.id)
    end
  end

  def update
    if @company.user_ids.include?(params[:company][:user_ids].to_i)
      redirect_to company_path(id: @company.id)
    else
      @company.user_ids = @company.user_ids << params[:company][:user_ids].to_i
      @company.save
      redirect_to company_path(id: @company.id)
    end
  end

  def show
    @users = User.all.where.not(id: @company.user_ids)
  end

  def delete

  end

  private
  def set_company
    @company = Company.find_by(id: params[:id])
  end

end
