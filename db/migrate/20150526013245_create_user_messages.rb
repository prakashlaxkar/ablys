class CreateUserMessages < ActiveRecord::Migration
  def change
    create_table :user_messages do |t|
      t.string :email
      t.string :subject
      t.string :message
      t.integer :user_id

      t.timestamps
    end
  end
end
