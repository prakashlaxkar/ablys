class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.string :video_holder_type
      t.integer :video_holder_id

      t.timestamps
    end
  end
end
