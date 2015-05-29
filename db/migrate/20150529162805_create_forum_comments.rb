class CreateForumComments < ActiveRecord::Migration
  def change
    create_table :forum_comments do |t|
      t.text :forum_comment
      t.references :forum, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
