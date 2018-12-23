class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :title
      t.text :description
      t.string :image_holder_type
      t.integer :image_holder_id

      t.timestamps
    end
  end
end
