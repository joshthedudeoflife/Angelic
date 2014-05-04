class AddInvestmentDateToInvestmentRounds < ActiveRecord::Migration
  def change
  	add_column :investment_rounds, :investment_date, :string
  end
end
