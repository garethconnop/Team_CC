class AddForumCommentsCountToForum < ActiveRecord::Migration
  def change
    add_column :forums, :forum_comments_count, :integer, default: 0
  end
end
