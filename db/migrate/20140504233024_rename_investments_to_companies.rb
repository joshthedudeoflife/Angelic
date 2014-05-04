class RenameInvestmentsToCompanies < ActiveRecord::Migration
  def change
    rename_table :investments, :companies
  end
end
