class AddColumnToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :end_date, :datetime
  	add_column :events, :is_verify, :boolean, default: false
  end
end
