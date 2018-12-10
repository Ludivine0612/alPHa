class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = current_user.companies.first
  end

  private
  def company_params
    params.require(:company).permit(:siret, :name)
  end
end
