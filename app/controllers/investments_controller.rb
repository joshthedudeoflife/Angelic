class InvestmentsController < ApplicationController
  def index
  	@investments = Investment.all
  end

  def new
  	@investment = Investment.new
  end

  def create
	  @investment = Investment.new(safe_params)

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

    if @investment.update(safe_params)
      redirect_to investments_path
    else 
      render :edit
    end
  end

  private

    def safe_params
      params.require(:investment).permit(:name, :investment_type, :amount_invested, :investment_date)
      # Make sure a key is in the params hash
      # _require_ method

      # Adding stuff to the whitelist, 
      # _permit_ method
    end
end
