class AddInfoToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :role, :string
  	add_column :users, :membership, :string
  end
end
