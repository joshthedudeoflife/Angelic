class AddCurrentDataToCompany < ActiveRecord::Migration
  def change
  	add_column :companies, :current_shares_outstanding, :decimal
  	add_column :companies, :current_pct_ownership, :decimal
  	add_column :companies, :current_valuation, :decimal
  	add_column :companies, :current_investment_value, :decimal
  	add_column :companies, :unrealized_roi, :decimal
  	add_column :companies, :initial_shares_outstanding, :decimal
  end
end
