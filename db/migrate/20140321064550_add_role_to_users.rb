class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :Role, :string
  end
end
