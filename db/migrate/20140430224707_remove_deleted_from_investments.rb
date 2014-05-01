class RemoveDeletedFromInvestments < ActiveRecord::Migration
  def change
  	remove_column :investments, :deleted
  end
end
