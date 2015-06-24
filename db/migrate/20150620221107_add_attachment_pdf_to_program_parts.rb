class AddAttachmentPdfToProgramParts < ActiveRecord::Migration
  def self.up
    change_table :program_parts do |t|
      t.attachment :pdf
    end
  end

  def self.down
    remove_attachment :program_parts, :pdf
  end
end
