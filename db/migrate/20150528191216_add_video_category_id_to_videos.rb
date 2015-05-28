class AddVideoCategoryIdToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :video_category_id, :string
    add_index :videos, :video_category_id
  end
end
