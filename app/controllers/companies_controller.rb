class CompaniesController < ApplicationController

  def index
    if session[:token].present?    
      set_qb_service 'CompanyInfo'
      @qb_company = @service.fetch_by_id @service.company_id
      @company = current_user.create_company :qb_id => @service.company_id if current_user.company.nil?
      @company ||= current_user.company
    end
  end

  def update
    if current_user.company.update company_params
      flash[:notice] = 'The logo was updated successfully'
    else
      flash[:error] = 'Somemthing went wrong trying to upload the image.'
    end
    redirect_to companies_path
  end

  private

  def company_params
    params.require(:company).permit(:logo)
  end
end