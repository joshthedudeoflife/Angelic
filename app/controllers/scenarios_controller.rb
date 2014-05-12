class ScenariosController < ApplicationController
  def new
  	@scenario = Scenario.new
    @company = Company.find params[:company_id]
  end
  def create
	  @scenario = Scenario.new(safe_params)
    company = Company.find params[:scenario][:company_id]
    @scenario.company_id = company.id

	  if @scenario.save
      scenario_calcs
	  	redirect_to scenario_path(@scenario.id)
	  else 
	  	render :new
	  end
  end
  def show
  	@scenario = Scenario.find params[:id]
  end
private
	def scenario_calcs
    @company = Company.find params[:scenario][:company_id]
    @scenario.pct_ownership = @company.current_pct_ownership * (@scenario.dilution / 100)
    @scenario.cash_returned = @scenario.pct_ownership * @scenario.exit_valuation
    @scenario.net_profit = @scenario.cash_returned - @company.amount_invested
    @scenario.amount_invested = @company.amount_invested
    @scenario.save
    @company.save
	end
  def safe_params
    params.require(:scenario).permit(:company_id, :acquirer, :date, :exit_valuation, :share_price, :shares_outstanding, :pct_ownership, :dilution, :cash_returned, :cash_profit, :net_profit, :created_at, :updated_at, :roi, :amount_invested)
  end

end
