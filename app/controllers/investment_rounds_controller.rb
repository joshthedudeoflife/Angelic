class InvestmentRoundsController < ApplicationController
  def new
  	@investment_round = InvestmentRound.new
  end

  def create
	  @investment_round = InvestmentRound.new(safe_params)
	  @investment = params[:investment_id]

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
    @investment.init_post_money = @investment.amount_invested / (@investment.pct_ownership/100)
    @investment.init_share_price = @investment.init_post_money / (@investment.shares_bought / (@investment.pct_ownership/100))
  end 
  def safe_params
    params.require(:investment_round).permit(:round_name, :investment_amount, :pre_money_valuation, :share_price, :investors, :investment_date, :investment_id)
    # Make sure a key is in the params hash
    # _require_ method

    # Adding stuff to the whitelist, 
    # _permit_ method
  end
end
