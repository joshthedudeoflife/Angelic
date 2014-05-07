class CreateCurrentSharePrice < ActiveRecord::Migration
  def change
    add_column :companies, :current_share_price, :decimal
  end
end
