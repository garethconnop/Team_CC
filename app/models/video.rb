class Video < ActiveRecord::Base
  belongs_to :video_category

	has_attached_file :image, :styles => { :large => "960x540>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  extend FriendlyId
  friendly_id :title, use: :slugged
end
