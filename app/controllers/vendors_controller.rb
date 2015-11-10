class VendorsController < ApplicationController
  
  def index
    if session[:token].present?    
      set_qb_service
      @vendors = @service.query(nil, :per_page => 50)
    end
# binding.pry
  end
end