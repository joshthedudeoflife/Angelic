class CreateInvestmentRounds < ActiveRecord::Migration
  def change
    create_table :investment_rounds do |t|
      t.decimal :investment_amount
      t.decimal :share_price
      t.decimal :pre_money_valuation
      t.text :investors

      t.timestamps
    end
  end
end
