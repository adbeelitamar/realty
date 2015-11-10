class PayplansController < ApplicationController

  def index
    @pay_plans = Payplan.all
  end

end