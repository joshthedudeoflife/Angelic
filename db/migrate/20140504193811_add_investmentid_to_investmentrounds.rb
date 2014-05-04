class AddInvestmentidToInvestmentrounds < ActiveRecord::Migration
  def change
  	add_column :investment_rounds, :investment_id, :integer
  end
end
