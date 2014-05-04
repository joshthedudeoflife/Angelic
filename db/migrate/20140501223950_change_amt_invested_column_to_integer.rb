class ChangeAmtInvestedColumnToInteger < ActiveRecord::Migration
  def change
  	change_column :investments, :amount_invested,  :integer
  end
end
