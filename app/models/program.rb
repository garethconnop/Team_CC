class Program < ActiveRecord::Base
	has_many :program_parts, dependent: :destroy
	validates :title, :description, presence: true

  extend FriendlyId
  friendly_id :title, use: :slugged
  
  def should_generate_new_friendly_id?
	  title_changed?
	end
end