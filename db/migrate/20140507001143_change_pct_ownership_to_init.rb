class ChangePctOwnershipToInit < ActiveRecord::Migration
  def change
  	rename_column :companies, :pct_ownership, :init_pc_ownership
  end
end
