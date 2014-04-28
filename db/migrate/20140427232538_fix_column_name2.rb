class FixColumnName2 < ActiveRecord::Migration
  def change
    change_table :investments do |t|
      t.rename :type, :investment_type

    end
  end
end
