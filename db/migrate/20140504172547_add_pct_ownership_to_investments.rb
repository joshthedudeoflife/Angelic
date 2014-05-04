class AddPctOwnershipToInvestments < ActiveRecord::Migration
  def change
  	add_column :investments, :pct_ownership, :integer
  end
end
