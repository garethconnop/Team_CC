class ProgramPart < ActiveRecord::Base
  belongs_to :program
  validates :title, :description, :pdf, presence: true
  
  has_attached_file :pdf
  validates_attachment :pdf, :content_type => { :content_type => ["application/pdf"] }, :file_name => { :matches => [/pdf\Z/] }
end
