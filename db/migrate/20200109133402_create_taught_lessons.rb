class CreateTaughtLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :taught_lessons do |t|
      t.references :subject, foreign_key: true
      t.references :tutor, foreign_key: true

      t.timestamps
    end
  end
end
