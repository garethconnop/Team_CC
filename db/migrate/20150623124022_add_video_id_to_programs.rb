class AddVideoIdToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :video_id, :string
  end
end
