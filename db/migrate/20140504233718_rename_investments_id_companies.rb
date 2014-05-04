class RenameInvestmentsIdCompanies < ActiveRecord::Migration
  def change
  	def change
    rename_column :investment_rounds, :investment_id, :company_id
  end
  end
end
