class InvestmentsController < ApplicationController
 before_action :authenticate_user!

  def index
  	@investments = Investment.all
  end

  def new
  	@investment = Investment.new
  end

  def create
	  @investment = Investment.new(safe_params)
    
    init_calcs

	  if @investment.save
	  	redirect_to investments_path
	  else 
	  	render :new
	  end
  end

  def show
    @investment = Investment.find params[:id]
  end

  def edit
    @investment = Investment.find params[:id]
  end

  def update
    @investment = Investment.find params[:id]

   init_calcs
    if @investment.update(safe_params)
      redirect_to investments_path
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
      params.require(:investment).permit(:name, :investment_type, :amount_invested, :investment_date, :pct_ownership, :shares_bought, :description)
      # Make sure a key is in the params hash
      # _require_ method

      # Adding stuff to the whitelist, 
      # _permit_ method
    end
end
