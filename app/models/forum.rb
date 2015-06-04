class Forum < ActiveRecord::Base
	belongs_to :forum_category
	belongs_to :user
	has_many :forum_comments, dependent: :destroy
	validates :title, :content, :forum_category_id, presence: true
	validates :title, length: {in: 5..100}

	scope :active,     ->{ where("forum_comments_count >= ?", 3) }
	scope :unanswered, ->{ where(forum_comments_count: 0) }

  # For Paranoia soft delete
  def user
  	User.unscoped { super }
  end
end
