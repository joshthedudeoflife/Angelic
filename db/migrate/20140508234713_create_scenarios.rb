class CreateScenarios < ActiveRecord::Migration
  def change
    create_table :scenarios do |t|
      t.integer :company_id
      t.string :acquirer
      t.string :date
      t.decimal :exit_valuation
      t.decimal :share_price
      t.decimal :shares_outstanding
      t.decimal :pct_ownership
      t.decimal :dilution
      t.decimal :cash_returned
      t.decimal :cash_profit
      t.decimal :net_profit
      t.timestamps
    end
  end
end
