class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :length
      t.text :description
      t.string :video_id

      t.timestamps null: false
    end
  end
end
