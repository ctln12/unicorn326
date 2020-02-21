class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.string :video_url
      t.references :booking, foreign_key: true

      t.timestamps
    end
  end
end
