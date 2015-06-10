class AddAttachmentPdfToPrograms < ActiveRecord::Migration
  def self.up
    change_table :programs do |t|
      t.attachment :pdf
    end
  end

  def self.down
    remove_attachment :programs, :pdf
  end
end
