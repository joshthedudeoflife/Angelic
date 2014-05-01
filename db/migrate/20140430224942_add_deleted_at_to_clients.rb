class AddDeletedAtToClients < ActiveRecord::Migration
  def change
    add_column :investments, :deleted_at, :datetime
    add_index :investments, :deleted_at
  end
end
