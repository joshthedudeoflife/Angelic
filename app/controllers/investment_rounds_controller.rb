class InvestmentRoundsController < ApplicationController

  def new
  	@investment_round = InvestmentRound.new
    @company = Company.find params[:company_id]
  end

  def create
	  @investment_round = InvestmentRound.new(safe_params)
    company = Company.find params[:company_id]
    @investment_round.company_id = company.id

	  if @investment_round.save
      new_round_calcs
	  	redirect_to company
	  else 
	  	render :new
	  end
  end
  def index
  	@investment_rounds = InvestmentRound.all
  end

  def show
  	@investment_round = Investment.find params[:id]
  end

  def edit
  	@investment_round = InvestmentRound.find params[:id]
    @company = Company.find params[:company_id]
  end
 	def update
	  	@investment_round = InvestmentRound.find params[:id]
      company = Company.find params[:investment_round][:company_id]
      @investment_round.company_id = company.id


	  if @investment_round.update(safe_params)
      new_round_calcs
	    redirect_to company
	  else 
	    render :edit
	  end
	end
  
private
  def safe_params
    params.require(:investment_round).permit(:round_name, :investment_amount, :pre_money_valuation, :share_price, :investors, :investment_date, :company_id, :init_post_money, :init_share_price)
  end
  def new_round_calcs
    @company = Company.find params[:investment_round][:company_id]
    @investment_round.share_price = @investment_round.pre_money_valuation / @company.current_shares_outstanding
    @company.current_share_price = @investment_round.share_price
    @company.current_valuation = @investment_round.pre_money_valuation + @investment_round.investment_amount
    @company.current_shares_outstanding = @company.current_shares_outstanding + (@investment_round.investment_amount/@investment_round.share_price)
    @company.current_pct_ownership = @company.shares_bought / @company.current_shares_outstanding
    @company.current_investment_value = @company.current_pct_ownership * @company.current_valuation
    @company.unrealized_roi = ((@company.current_share_price - @company.init_share_price)/@company.init_share_price)*100
    @company.save
    @investment_round.save
  end
end
