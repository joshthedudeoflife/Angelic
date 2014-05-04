class AddDescriptionToInvestments < ActiveRecord::Migration
  def change
  	add_column :investments, :description, :text
  end
end
