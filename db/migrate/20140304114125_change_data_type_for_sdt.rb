class ChangeDataTypeForSdt < ActiveRecord::Migration
  def up
  	change_column :savingsdeposittransactions, :transaction_amount, :integer
  end

  def down
  	change_column :savingsdeposittransactions, :transaction_amount, :string
  end
end
