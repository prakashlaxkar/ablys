class AddColumnToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :gotra, :string
  	add_column :users, :marital_status, :string
  	add_column :users, :qualification, :string
  	add_column :users, :designation, :string
  	add_column :users, :company_name, :string
  	add_column :users, :income, :string
  end
end
