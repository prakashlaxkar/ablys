class AddSerialNumberToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :serial_number, :string
    add_column :users, :is_ablys_member, :boolean, :default => false
  end
end
