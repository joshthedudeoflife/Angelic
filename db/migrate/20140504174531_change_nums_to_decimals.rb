class ChangeNumsToDecimals < ActiveRecord::Migration
  def change
  	  	change_column :investments, :amount_invested,  :decimal
  	  	change_column :investments, :pct_ownership,  :decimal
  end
end
