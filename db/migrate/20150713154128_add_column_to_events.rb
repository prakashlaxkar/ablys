class AddColumnToEvents < ActiveRecord::Migration[5.2]
  def change
  	add_column :events, :end_date, :datetime
  	add_column :events, :is_verify, :boolean, default: false
  end
end
