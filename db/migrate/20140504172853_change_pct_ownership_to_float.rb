class ChangePctOwnershipToFloat < ActiveRecord::Migration
  def change
  	  	change_column :investments, :amount_invested,  :float
  	  	change_column :investments, :pct_ownership,  :float
  end
end
