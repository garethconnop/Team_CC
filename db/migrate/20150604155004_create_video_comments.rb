class CreateVideoComments < ActiveRecord::Migration
  def change
    create_table :video_comments do |t|
      t.text :video_comment
      t.references :video, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
