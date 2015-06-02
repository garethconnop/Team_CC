class Forum < ActiveRecord::Base
	belongs_to :forum_category
	belongs_to :user
	has_many :forum_comments, dependent: :destroy

	scope :active,     ->{ where("forum_comments_count >= ?", 3) }
	scope :unanswered, ->{ where(forum_comments_count: 0) }

	extend FriendlyId
  friendly_id :title, use: :slugged
end
