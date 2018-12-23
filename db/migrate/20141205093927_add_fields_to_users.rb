class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :dob, :string
    add_column :users, :f_name, :string
    add_column :users, :gender, :string
    add_column :users, :email, :string
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :country, :string
    add_column :users, :pin_code, :string
    add_column :users, :phone, :string
    add_column :users, :is_matrimony, :boolean, :default => false
  end
end
