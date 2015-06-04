class VideoComment < ActiveRecord::Base
  belongs_to :video
  belongs_to :user
  validates :video_comment, presence: true

  # For Paranoia soft delete
  def user
  	User.unscoped { super }
  end
end
