class ScenariosController < ApplicationController
  def new
  	@scenario = Scenario.new
    @company = Company.find params[:company_id]
  end
  def create
	  @scenario = Scenario.new(safe_params)
	  @investment_round.company_id = company.id
    company = Company.find params[:scenario][:company_id]

	  if @scenario.save
      scenario_calcs
	  	redirect_to 
	  else 
	  	render :new
	  end
  end
  def show
  	@investment_round = InvestmentRound.find params[:id]
  end
private
	def scenario_cals
	end
end
