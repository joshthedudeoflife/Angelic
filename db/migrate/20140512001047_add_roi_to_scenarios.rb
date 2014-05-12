class AddRoiToScenarios < ActiveRecord::Migration
  def change
  	add_column :scenarios, :exit_roi, :decimal
  	add_column :scenarios, :amount_invested, :decimal
  end
end
