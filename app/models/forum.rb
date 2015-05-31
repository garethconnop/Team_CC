class Forum < ActiveRecord::Base
	belongs_to :forum_category
	belongs_to :user
	has_many :forum_comments
end
