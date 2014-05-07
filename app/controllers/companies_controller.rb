class CompaniesController < ApplicationController
 before_action :authenticate_user!

  def index
  	@companies = Company.all
  end

  def new
  	@company = Company.new
  end

  def create
	  @company = Company.new(safe_params)
    
    init_calcs

	  if @company.save
	  	redirect_to companies_path
	  else 
	  	render :new
	  end
  end

  def show
    @company = Company.find params[:id]
    @rounds = InvestmentRound.where(company_id: params[:id])
  end

  def edit
    @company = Company.find params[:id]
  end

  def update
    @company = Company.find params[:id]

   init_calcs
    if @company.update(safe_params)
      redirect_to companies_path
    else 
      render :edit
    end
  end
  private
    def init_calcs
      @company.init_post_money = @company.amount_invested / (@company.init_pct_ownership/100)
      @company.init_share_price = @company.init_post_money / (@company.shares_bought / (@company.init_pct_ownership/100))
      @company.initial_shares_outstanding = @company.shares_bought / (@company.init_pct_ownership/100)
      @company.current_valuation = @company.init_post_money
      @company.current_shares_outstanding = @company.initial_shares_outstanding
      @company.current_pct_ownership = @company.init_pct_ownership
      @company.current_investment_value = @company.amount_invested
      @company.current_share_price = @company.init_share_price
      @company.unrealized_roi = 0

    end 
    def safe_params
      params.require(:company).permit(:name, :investment_type, :amount_invested, :investment_date, :init_pct_ownership, :shares_bought, :description, :initial_shares_outstanding, :current_shares_outstanding, :current_pct_ownership, :current_valuation, :current_investment_value, :unrealized_roi, :current_share_price)
    end
    

end
