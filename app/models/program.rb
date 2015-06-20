class Program < ActiveRecord::Base
	has_many :program_parts, dependent: :destroy
	validates :title, :description, presence: true
end
