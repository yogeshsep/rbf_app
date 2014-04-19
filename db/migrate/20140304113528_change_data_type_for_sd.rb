class ChangeDataTypeForSd < ActiveRecord::Migration
  def up
  	change_column :savingsdeposits, :current_balance, :integer
  end

  def down
  	change_column :savingsdeposits, :current_balance, :string
  end
end
