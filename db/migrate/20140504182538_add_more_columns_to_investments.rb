class AddMoreColumnsToInvestments < ActiveRecord::Migration
  def change
		add_column :investments, :shares_bought, :integer
		add_column :investments, :init_share_price, :decimal
  	add_column :investments, :init_post_money, :decimal
  end
end
