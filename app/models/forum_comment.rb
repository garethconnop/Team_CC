class ForumComment < ActiveRecord::Base
  belongs_to :forum, counter_cache: true
  belongs_to :user
  validates :forum_comment, presence: true

  # For Paranoia soft delete
  def user
  	User.unscoped { super }
  end
end