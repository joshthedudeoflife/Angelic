class Changepctopct < ActiveRecord::Migration
  def change
  	rename_column :companies, :init_pc_ownership, :init_pct_ownership
  end
end
