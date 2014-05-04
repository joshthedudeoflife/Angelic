class InvestmentRoundsController < ApplicationController
  def new
  	@investment_round = InvestmentRound.new
  end

  def create
	  @investment_round = InvestmentRound.new(safe_params)
	  @company = params[:company_id]

	  if @investment_round.save
	  	redirect_to investment_rounds_path
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
  end
 	def update
	  	@investment_round = InvestmentRound.find params[:id]

	  if @investment_round.update(safe_params)
	    redirect_to investment_rounds_path
	  else 
	    render :edit
	  end
	end
  
private
  def init_calcs
    @company.init_post_money = @company.amount_invested / (@company.pct_ownership/100)
    @company.init_share_price = @company.init_post_money / (@company.shares_bought / (@company.pct_ownership/100))
  end 
  def safe_params
    params.require(:investment_round).permit(:round_name, :investment_amount, :pre_money_valuation, :share_price, :investors, :investment_date, :company_id, :init_post_money, :init_share_price)
    # Make sure a key is in the params hash
    # _require_ method

    # Adding stuff to the whitelist, 
    # _permit_ method
  end
end
