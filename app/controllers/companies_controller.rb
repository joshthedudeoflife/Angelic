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
      @company.init_post_money = @company.amount_invested / (@company.pct_ownership/100)
      @company.init_share_price = @company.init_post_money / (@company.shares_bought / (@company.pct_ownership/100))
    end 
    def safe_params
      params.require(:company).permit(:name, :investment_type, :amount_invested, :investment_date, :pct_ownership, :shares_bought, :description)
      # Make sure a key is in the params hash
      # _require_ method

      # Adding stuff to the whitelist, 
      # _permit_ method
    end
end
