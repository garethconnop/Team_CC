class Video < ActiveRecord::Base
  belongs_to :video_category
  has_many :video_comments, dependent: :destroy
  validates :title, :description, :video_category_id, :image, :video_id, :length, presence: true

	has_attached_file :image, :styles => { :large => "960x540>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  def slug_candidates
    [
      :title,
      [:title, :video_category_id]
    ]
  end

  def should_generate_new_friendly_id?
	  title_changed?
	end
end
