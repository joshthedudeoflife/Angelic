class CreateInvestments < ActiveRecord::Migration
  def change
    create_table :investments do |t|
      t.string :name
      t.string :type
      t.string :amount_invested
      t.string :investment_date

      t.timestamps
    end
  end
end
