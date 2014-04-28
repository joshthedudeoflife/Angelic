class FixColumnName < ActiveRecord::Migration
  class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :investments, :type, :investment_type
  end
end
end
