class AddDeletedToInvestments < ActiveRecord::Migration
  def change
  	   add_column :investments, :deleted, :integer
  end
end
