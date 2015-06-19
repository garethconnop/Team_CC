class CreateProgramParts < ActiveRecord::Migration
  def change
    create_table :program_parts do |t|
      t.string :title
      t.text :description
      t.references :program, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
