class AddRoundNameToInvestmentRounds < ActiveRecord::Migration
  def change
  	add_column :investment_rounds, :round_name, :string
  end
end
