class RenameCompanies < ActiveRecord::Migration
  def change
  	rename_column :investment_rounds, :investment_id, :company_id
  end
end
